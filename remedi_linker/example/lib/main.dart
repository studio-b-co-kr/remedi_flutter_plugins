
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remedi_linker/remedi_linker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RemediLinker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'RemediLinker Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Container(
        child:  Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                    height: 10,
                  ),
                  RemediLinker(
                    "Hi here's my email: samuelezedi@gmail.com and website: https://pronoun.com.ng",
                  )
                ],
              ),
        ),


      ),
    );
  }
}
