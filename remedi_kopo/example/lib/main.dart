import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopo Demo',
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String addressJSON = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remedi Kopo Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: ElevatedButton(
            child: Text('Find Korean Postal Address'),
            onPressed: () async {
              KopoModel model = await Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => RemediKopo(),
                ),
              );
              print(model.toJson());
              setState(() {
                addressJSON =
                    '${model.address} ${model.buildingName}${model.apartment == 'Y' ? '아파트' : ''} ${model.zonecode} ';
              });
            },
          )),
          Text('$addressJSON'),
        ],
      ),
    );
  }
}
