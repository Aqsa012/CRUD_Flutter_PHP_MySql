//import 'dart:html';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:crud_form_flutter_php_mysql/readdata.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x83AD74FF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/aqii.jpg'),
              radius: 70.0,
            ),
            Text(
              'Aqsa Tariq',
              style: TextStyle(
                fontFamily: 'Montserrat-Italic',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            SizedBox(
              height: 10.0,
              width: 450.0,
              child: Divider(
                color: Colors.white,
                thickness: 1.0,
              ),
            ),
            Text(
              'FA17-BCS-012',
              style: TextStyle(
                fontFamily: 'Montserrat-Light',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 5.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
