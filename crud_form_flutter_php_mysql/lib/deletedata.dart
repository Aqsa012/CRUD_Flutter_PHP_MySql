import 'package:flutter/material.dart';
import 'package:crud_form_flutter_php_mysql/editdata.dart';
import 'package:http/http.dart' as http;
import 'package:crud_form_flutter_php_mysql/readdata.dart';

class Details extends StatefulWidget {
  List list;
  int index;

  Details({required this.list, required this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void deleteData() {
    var url = "http://192.168.0.112/dashboard/crudapp/deletedata.php";

    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      //   'name': "NAME"
    });
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: Text(
          "Are you sure you want to delete this record ${widget.list[widget.index]['name']}"),
      actions: <Widget>[
        new RaisedButton.icon(
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Home(),
            ));
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          label: Text(
            'OK, Delete',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          textColor: Colors.white,
          splashColor: Colors.redAccent,
          color: Colors.red,
        ),
        new RaisedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          label: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          textColor: Colors.white,
          splashColor: Colors.green,
          color: Colors.green,
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['name']}"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFF6D1ADC), Color(0xE149B108)])),
        ),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Row(children: <Widget>[
                new Text(
                  'Name: ',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
                new Text(
                  widget.list[widget.index]['name'],
                  style: new TextStyle(fontSize: 20.0),
                ),
              ]),
              SizedBox(
                height: 10.0,
              ),
              Row(children: <Widget>[
                new Text(
                  'Email: ',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
                new Text(
                  widget.list[widget.index]['email'],
                  style: new TextStyle(fontSize: 20.0),
                ),
              ]),
              SizedBox(
                height: 10.0,
              ),
              Row(children: <Widget>[
                new Text(
                  'Mobile: ',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
                new Text(
                  widget.list[widget.index]['mobile'],
                  style: new TextStyle(fontSize: 20.0),
                ),
              ]),
              SizedBox(
                height: 10.0,
              ),
              Row(children: <Widget>[
                new Text(
                  'Skill: ',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
                new Text(
                  widget.list[widget.index]['skill'],
                  style: new TextStyle(fontSize: 20.0),
                ),
              ]),
              SizedBox(
                height: 10.0,
              ),
              Row(children: <Widget>[
                new Text(
                  'Blood Group: ',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
                new Text(
                  widget.list[widget.index]['bloodgroup'],
                  style: new TextStyle(fontSize: 20.0),
                ),
              ]),
              SizedBox(
                height: 10.0,
              ),
              Row(children: <Widget>[
                new Text(
                  'Address: ',
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
                new Text(
                  widget.list[widget.index]['address'],
                  style: new TextStyle(fontSize: 20.0),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton.icon(
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new EditData(list: widget.list, index: widget.index),
                    )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    splashColor: Colors.green,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  new RaisedButton.icon(
                    onPressed: () => confirm(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    splashColor: Colors.redAccent,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
