import 'package:flutter/material.dart';

import 'gallery-detail.dart';
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyWord = "";
  TextEditingController editingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.keyWord), backgroundColor: Colors.deepOrange,),
      body: Column(
        children: [
           Container(
              child: TextField(
                decoration: InputDecoration(hintText: "Tape a place"),
                style: TextStyle(fontSize: 22),
                onChanged: (value) {
                  setState(() {
                    this.keyWord = value;
                  });
                },
                controller: editingController,
                onSubmitted: (value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryDetail(keyWord)));
                    editingController.text = "";
                },
            ),  
            padding: EdgeInsets.all(10),            
            ),
            Container(width: double.infinity ,child: RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryDetail(keyWord)));
            editingController.text = "";
           },
           color: Colors.deepOrange,
           padding: EdgeInsets.all(10),
           child: Text("Get Images", style: TextStyle(fontSize: 22, color: Colors.white)), 
           ))
        ]
      ),
    );
  }
}