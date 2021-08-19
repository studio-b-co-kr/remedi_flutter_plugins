import 'package:flutter/material.dart';
import 'package:remedi_send_to_store/remedi_send_to_store.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Launch App Redirect')),
            body: new Center(
                child: new RaisedButton(
                    child: new Text("Redirect App"),
                    onPressed: () {
                      RemediSendToStore.send(
                          androidAppId: "com.remedi.example",
                          iOSAppId: "00000000");
                    }))));
  }
}
