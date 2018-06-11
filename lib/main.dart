import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_challenge_mp/bottom_controls.dart';
import 'package:flutter_challenge_mp/songs.dart';
import 'package:flutter_challenge_mp/theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
          ),
          color: const Color(0xFFDDDDDD),
          onPressed: () {},
        ),
        title: new Text(''),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.menu,
            ),
            color: const Color(0xFFDDDDDD),
            onPressed: () {},
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          // Seek bar
          new Expanded(
            child: new Center(
                child: new Container(
              width: 125.0,
              height: 125.0,
              child: new ClipOval(
                clipper: new CircleClipper(),
                child: new Image.network(demoPlaylist.songs[0].albumArtUrl,
                    fit: BoxFit.cover),
              ),
            )),
          ),

          // Visualizer
          new Container(
            width: double.infinity,
            height: 125.0,
          ),

          // Song title, artist name, and controls
          new BottomControls(),
        ],
      ),
    );
  }
}

