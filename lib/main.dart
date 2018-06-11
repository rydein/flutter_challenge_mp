import 'dart:math';

import 'package:flutter/material.dart';
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
          new Container(
              color: accentColor,
              child: new Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
                child: new Column(
                  children: <Widget>[
                    new RichText(
                        text: new TextSpan(
                      text: '',
                      children: [
                        new TextSpan(
                          text: 'Song Title\n',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                            height: 1.5,
                          ),
                        ),
                        new TextSpan(
                          text: 'Artist Name',
                          style: new TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 12.0,
                            letterSpacing: 3.0,
                            height: 1.5,
                          ),
                        )
                      ],
                    )),
                    new Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(child: new Container()),
                            new IconButton(
                              icon: new Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              onPressed: () {
                                // TODO
                              },
                            ),
                            new Expanded(child: new Container()),
                            new RawMaterialButton(
                                shape: new CircleBorder(),
                                fillColor: Colors.white,
                                splashColor: lightAccentColor,
                                highlightColor:
                                    lightAccentColor.withOpacity(0.5),
                                elevation: 10.0,
                                highlightElevation: 5.0,
                                onPressed: () {
                                  // TODO
                                },
                                child: new Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Icon(
                                    Icons.play_arrow,
                                    color: darkAccentColor,
                                    size: 35.0,
                                  ),
                                )),
                            new Expanded(child: new Container()),
                            new IconButton(
                              icon: new Icon(
                                Icons.skip_next,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              onPressed: () {
                                // TODO
                              },
                            ),
                            new Expanded(child: new Container()),
                          ],
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromCircle(
      center: new Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}