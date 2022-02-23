import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore_for_file: prefer_const_constructors

class multiply extends StatefulWidget {
  const multiply({Key? key}) : super(key: key);

  @override
  _multiplyState createState() => _multiplyState();
}

class _multiplyState extends State<multiply> {
  final tvalor = TextEditingController();
  var val = 0;
  var rest = 0;
  bool isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () {
              setState(() {
                val = int.parse(tvalor.text);
                isvisible = true;
              });
            }),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: tvalor,
                  decoration: InputDecoration(
                    labelText: 'Numero de la tabla',
                  ),
                ),
                for (var i = 1; i < 13; i++)
                  Visibility(
                    visible: isvisible,
                    child: Card(
                      child: ListTile(
                        title: Text(tvalor.text +
                            " X " +
                            i.toString() +
                            " = " +
                            "${val * i}"),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
