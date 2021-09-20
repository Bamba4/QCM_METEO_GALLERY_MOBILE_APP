import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryDetail extends StatefulWidget {
  String keyWord = "";
  GalleryDetail(this.keyWord);

  @override
  _GalleryDetailState createState() => _GalleryDetailState();
}

class _GalleryDetailState extends State<GalleryDetail> {
  int currentPage=1;
  int size=10;
  int totalPage;
  ScrollController _scrollController = new ScrollController();
  List<dynamic> hits = [];
  var galleryData;

  @override
  void initState() {
    super.initState();
    this.getData();
    _scrollController.addListener(() {
       if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent) {
         if(this.currentPage < this.totalPage) {
            ++currentPage;
            this.getData();
         }
    
       }
    });
  }

  getData() {
    String  url = "https://pixabay.com/api/?key=7702561-f5132c8dfe875c4f3d4281af6&q=${widget.keyWord}&page=${currentPage}&per_page=${size}";
    http.get(url).then((resp) => {
        setState(() {
            galleryData = json.decode(resp.body);
            this.hits.addAll(galleryData['hits']);
            if(galleryData['totalHits']%size==0) {
              totalPage = galleryData['totalHits']~/size;
            } else {
              totalPage = 1 + (galleryData['totalHits']/size).floor();
            }
            print(this.hits);
        })
    }).catchError((err) {
        print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.keyWord} | ${currentPage} | ${totalPage}"), backgroundColor: Colors.deepOrange),
      body: (galleryData == null ? 
          Center(child: Container(child: CircularProgressIndicator())) : 
          ListView.builder(
            itemCount: galleryData == null ? 0 : hits.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Container(child: Text(hits[index]['tags'], style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),))),
                        ),
                        
                        color: Colors.deepOrange,
                      ),
                
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      width: double.infinity,
                      child: Card(
                        child: Image.network(hits[index]['previewURL'], fit: BoxFit.fitWidth,),
                      )
                    )
                  ],
              );
            },
          )
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this._scrollController.dispose();
  }
}