import 'package:flutter/material.dart';
import 'package:crud_form_flutter_php_mysql/splash.dart';
import 'package:crud_form_flutter_php_mysql/readdata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Persobal Information',
      home: MyHomePage(),
    );
  }
}
