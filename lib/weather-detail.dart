import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherDetails extends StatefulWidget {
  String city = "";
  WeatherDetails(this.city);
  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  var weatherData;
  @override
  void initState() {
    print("Bonjour Coumba");
    super.initState();
    this.getData(widget.city);
  }

  getData(String city) {
      String url = 'https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=562218869adeff7c824caaa623cb7e94';
      http.get(url).then((resp) {
        print("Khadim");
        setState(() {
          this.weatherData = json.decode(resp.body);
          print(this.weatherData);
        });
      }).catchError((err) {
          print(err);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather of city ${widget.city}'),backgroundColor: Colors.deepOrangeAccent,),
      body: (weatherData == null ? 
        Center(
          child: CircularProgressIndicator(),
        )
       : 
       (weatherData !=  null && weatherData['cod'] != '200') ? Center(child: Text(weatherData['message'].toString(), style: TextStyle(fontSize: 22, color: Colors.redAccent),)) : 
       ListView.builder(
         itemCount: (weatherData == null ? 0 : weatherData['list'].length),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepOrange,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                        backgroundImage: AssetImage("images/${weatherData['list'][index]['weather'][0]['main']}.jpeg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${new DateFormat('E dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt'] * 1000000))}", style: TextStyle(fontSize: 22, color: Colors.white),),
                              Text("${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt'] * 1000000))} | ${weatherData['list'][index]['weather'][0]['main']}", style: TextStyle(fontSize: 22, color: Colors.white),),
                            ]
                          ),
                        )
                      ]
                    ),
                    Text( "${weatherData['list'][index]['main']['temp'].round()} oC", style: TextStyle(fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),),
                  ]
                ),
              )
            );
          },    
       )
       ),
    );
  }
}