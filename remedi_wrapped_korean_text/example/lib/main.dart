import 'package:flutter/material.dart';
import 'package:wrapped_korean_text/wrapped_korean_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Wrapped Korean Text Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text =
      '''고려(高麗)는 918년 궁예를 축출하고 왕건이 즉위한 이후, 1392년 이성계에 의해 멸망하기까지 한반도 대부분을 지배하였던 국가이다. 또한 고려는 외왕내제를 가장 적극적으로 한 국가이며 고려의 국왕은 생전에는 황제라 칭했으나 붕어 이후 시호는 대왕으로 올렸다.

통일신라 하대에 송악(현재의 개성특별시) 지방의 호족인 왕건이 918년에 개국하여, 919년에 송악을 개경이라 이름을 고치고, 수도로 삼았다. 그 뒤, 935년 신라, 936년 후백제를 차례대로 복속하였다.''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 18),
          Text('Flutter\'s Text widget:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
              color: Colors.red[50],
              padding: EdgeInsets.all(8),
              child: Text(
                _text,
              )),
          SizedBox(height: 18),
          Text('Wrapped Korean Text widget:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
              color: Colors.blue[50],
              padding: EdgeInsets.all(8),
              child: WrappedKoreanText(_text))
        ],
      ),
    );
  }
}
