import 'package:flutter/material.dart';
import './main-drawer.dart';
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text("My APP"), backgroundColor: Colors.deepOrange),
        body:   Image.asset('images/coum.JPG', width: 1000,)
    );
  }
}
