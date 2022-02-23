import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parcial1/mayor.dart';
import 'package:parcial1/multiplicar.dart';

// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = 'https://randomuser.me/api/portraits/men/32.jpg';
  String bgimg =
      'https://images.unsplash.com/photo-1549490316-686f9b5d359f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int p) {
    switch (p) {
      case 0:
        return multiply();
      case 1:
        return mayor();
    }
  }

  _onSelectItem(int pos) {
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Randy Frias'),
              accountEmail: Text('Mobile Developer'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(bgimg),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text('Tabla de multiplicar'),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward_ios),
              title: Text('Numero mayor'),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Salir'),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}


//Randy Frias
//2019-8464