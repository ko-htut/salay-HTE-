import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mahar_bote_flutter/body.dart';
import 'package:mahar_bote_flutter/bodycho.dart';
import 'package:mahar_bote_flutter/custom_top_bar.dart';
 
void main() {
  //SystemChrome.setEnabledSystemUIOverlays([]);
runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: BodyCho()
    );
  }
}