import 'package:flutter/material.dart';
import 'package:crud_form_flutter_php_mysql/readdata.dart';
import 'deletedata.dart';

import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController id;
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController mobile;
  late TextEditingController skill;
  late TextEditingController bloodgroup;
  late TextEditingController address;
  void editData() {
    var url = "http://192.168.0.112/dashboard/crudapp/editdata.php";

    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "name": name.text,
      "mobile": mobile.text,
      "email": email.text,
      "skill": skill.text,
      "bloodgroup": bloodgroup.text,
      "address": address.text
    });
  }

  @override
  void initState() {
    id = new TextEditingController(text: widget.list[widget.index]['id']);
    name = new TextEditingController(text: widget.list[widget.index]['name']);
    email = new TextEditingController(text: widget.list[widget.index]['email']);
    mobile =
        new TextEditingController(text: widget.list[widget.index]['mobile']);
    skill = new TextEditingController(text: widget.list[widget.index]['skill']);
    bloodgroup = new TextEditingController(
        text: widget.list[widget.index]['bloodgroup']);
    address =
        new TextEditingController(text: widget.list[widget.index]['address']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Edit Data"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFF6D1ADC), Color(0xE149B108)])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: name,
                  decoration: new InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: Color(0xE149B108),
                    ),
                  ),
                ),
                new TextField(
                  controller: email,
                  decoration: new InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Color(0xE149B108),
                    ),
                  ),
                ),
                new TextField(
                  controller: mobile,
                  decoration: new InputDecoration(
                    labelText: "Mobile",
                    labelStyle: TextStyle(
                      color: Color(0xE149B108),
                    ),
                  ),
                ),
                new TextField(
                  controller: skill,
                  decoration: new InputDecoration(
                    labelText: "Skill",
                    labelStyle: TextStyle(
                      color: Color(0xE149B108),
                    ),
                  ),
                ),
                new TextField(
                  controller: bloodgroup,
                  decoration: new InputDecoration(
                    labelText: "Blood Group",
                    labelStyle: TextStyle(
                      color: Color(0xE149B108),
                    ),
                  ),
                ),
                new TextField(
                  controller: address,
                  decoration: new InputDecoration(
                    labelText: "Address",
                    labelStyle: TextStyle(
                      color: Color(0xE149B108),
                    ),
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new RaisedButton.icon(
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  label: Text(
                    'Edit Data',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.deepPurple,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
