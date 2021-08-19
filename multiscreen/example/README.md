# multiscreen_example

How to use.

    import 'package:flutter/material.dart';
    import 'package:multiscreen/multiscreen.dart';

    void main() => runApp(MyApp());

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          theme: ThemeData.light(),
          home: _MyPage(),
        );
      }
    }

    class _MyPage extends StatefulWidget {
      @override
      State<StatefulWidget> createState() {
        return _MyPageState();
      }
    }

    class _MyPageState extends State<_MyPage> {
      @override
      Widget build(BuildContext context) {
        return Container(
          color: Colors.white,
          /// resize using Multiscreen.
          margin: EdgeInsets.only(top: resize(80)),
          child: Align(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              MaterialButton(
                color: Colors.blue,
                height: resize(40),
                minWidth: resize(280),
                child: Text(
                  'text',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: resize(16)),
                ),
                onPressed: () {},
              ),
              MaterialButton(
                color: Colors.blue,
                height: resize(40),
                minWidth: resize(300),
                child: Text(
                  'text',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: resize(16)),
                ),
                onPressed: () {},
              ),
              MaterialButton(
                color: Colors.blue,
                height: resize(40),
                minWidth: resize(320),
                child: Text(
                  'text',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: resize(16)),
                ),
                onPressed: () {},
              ),
              MaterialButton(
                color: Colors.blue,
                height: resize(40),
                minWidth: resize(340),
                child: Text(
                  'text',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: resize(16)),
                ),
                onPressed: () {},
              ),
              MaterialButton(
                color: Colors.blue,
                height: resize(40),
                minWidth: resize(360),
                child: Text(
                  'text',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0.resize360),
                ),
                onPressed: () {},
              ),
            ]),
          ),
        );
      }
    }


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
