import 'package:flutter/material.dart';

import 'Quiz.dart';
import 'camera.dart';
import 'gallery.dart';
import 'weather.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.deepOrange, Colors.white])),
                  child:  Center(child: CircleAvatar(radius: 100,backgroundImage: AssetImage("images/coumba.JPG"))),
                ),
                ListTile(
                  title: Text('Quiz', style: TextStyle(fontSize: 20),),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz()));
                  },
                ),
                Divider(height: 4, color: Colors.deepOrange,),
                ListTile(
                  title: Text('Weather', style: TextStyle(fontSize: 20)),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Weather()));
                  },
                ),
                Divider(height: 4, color: Colors.deepOrange,),
                ListTile(
                  title: Text('Gallery', style: TextStyle(fontSize: 20)),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery()));
                  },
                ),
                Divider(height: 4, color: Colors.deepOrange,),
                ListTile(
                  title: Text('Camera', style: TextStyle(fontSize: 20)),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
                  },
                )
              ],
            )
        );
  }
}