import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:crud_form_flutter_php_mysql/adddata.dart';
import 'package:crud_form_flutter_php_mysql/deletedata.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.0.112/dashboard/crudapp/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Personal Information",
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFF6D1ADC), Color(0xE149B108)])),
        ),
        // backgroundColor: Color(0xFFC2A736),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new AddData(),
          ),
        ),
        child: new Icon(Icons.add),
        backgroundColor: Color(0xFF6D1ADC),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return ItemList(list: snapshot.data ?? []);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new ListTile(
          title: new Text(
            list[i]['name'],
            style: TextStyle(
              color: Color(0xE149B108),
            ),
          ),
          subtitle: new Text(list[i]['email']),
          leading: new Icon(Icons.edit),
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) =>
                new Details(list: list, index: i),
          )),
        );
      },
    );
  }
}
