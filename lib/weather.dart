import 'package:flutter/material.dart';
import 'weather-detail.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city = "";
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController,
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(hintText: "Taper une ville"),
              onChanged: (value) {
                setState(() {
                  this.city = value;
                });
              },
              onSubmitted: (value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherDetails(city)));
                textEditingController.text = "";
              },
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherDetails(city)));
                  textEditingController.text = "";
                },
                color: Colors.deepOrangeAccent,
                child: Text("Get Weather...", style: TextStyle(fontSize: 22, color: Colors.white),),
              ),
            )
          ) 
        ],
      ),
    );
  }
}