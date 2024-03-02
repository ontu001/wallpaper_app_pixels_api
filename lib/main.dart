import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app_pixels_api/screens/walpaper.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Walpaper Application",
      theme: ThemeData.dark(
      ),
      home: Walpaper(),
    );
  }

}