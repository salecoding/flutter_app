import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'counter.dart';
import 'list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new ButtonList(),
    );
  }
}

class ButtonList extends StatefulWidget {
  @override
  createState() => new ButtonListState();
}

class ButtonListState extends State<ButtonList> {
  void startListPage() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new List();
    }));
  }

  void startCounterPage() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new Counter();
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new MaterialButton(
              child: new Text('list'),
              onPressed: startListPage,
              color: Colors.blue,
              textColor: Colors.white,
            ),
            new MaterialButton(
              child: new Text('counter'),
              onPressed: startCounterPage,
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
