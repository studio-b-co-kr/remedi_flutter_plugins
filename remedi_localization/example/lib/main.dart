import 'package:remedi_localization/remedi_localization.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Country Code Pick'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Text('Pick your country'),
            ),
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: true,
              isShowCode: true,
              isDownIcon: true,
              showEnglishName: false,
              labelColor: Colors.blueAccent,
            ),
            initialSelection: '+82',
            // or
            // initialSelection: 'US'
            onChanged: (CountryCode? code) {
              print(code?.name);
              print(code?.code);
              print(code?.dialCode);
              print(code?.flagUri);
            },
          ),
        ),
      ),
    );
  }
}
