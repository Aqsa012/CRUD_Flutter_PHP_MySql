import 'package:crud_form_flutter_php_mysql/readdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController id = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController skill = new TextEditingController();
  TextEditingController bloodgroup = new TextEditingController();
  TextEditingController address = new TextEditingController();

  void addData() {
    var url = "http://192.168.0.112/dashboard/crudapp/adddata.php";
    http.post(url, body: {
      "id": id.text,
      "name": name.text,
      "mobile": mobile.text,
      "email": email.text,
      "skill": skill.text,
      "bloodgroup": bloodgroup.text,
      "address": address.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Add Data"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFF6D1ADC), Color(0xE149B108)])),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
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
                      addData();
                      //Navigator.of(context).pop();
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new Home()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text(
                      'Add Data',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.add,
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
        ));
  }
}
