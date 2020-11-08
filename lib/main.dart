import 'package:flutter/material.dart';
import 'dart:math';
import 'business_card.dart';
import 'resume.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Terminus'
      ),
      home: MyHomePage(title: 'I, Monster'),
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
  int _answerKey = 0;
  var _answers = [
    "Nope",
    "Definitely not",
    "Most likely no",
    "Probably not",
    "No, sorry",
    "Maybe next time",
    "Unfortunately not",
    "No."
  ];


  void _updateAnswer() {
    setState(() {
      _answerKey = new Random().nextInt(8);
    });
  }

  Widget _predictorTapping() {
    return Expanded(
      child: InkWell(
        child: Text(
          "Ask a question.. tap for an answer",
          style: TextStyle(color: Colors.black),
        ),
        onTap: _updateAnswer
      )
    );
  }

  Widget _predictor() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(child: Text("Call Me... Maybe?", style: TextStyle(fontSize: 25)), padding: EdgeInsets.only(bottom: 8.0)),
          Padding(child: _predictorTapping(), padding: EdgeInsets.all(8.0)),
          Padding(child: Text("${_answers[_answerKey]}", style: TextStyle(fontSize: 20.0)), padding: EdgeInsets.only(top: 8.0))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xffc5dad6),
        appBar: AppBar(
          shadowColor: Color(0xfff83b6c),
          backgroundColor: Color(0xffe4b5b5),
          title: Center(child: Text(widget.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.black))),
          bottom: TabBar(
            indicatorColor: Color(0xfff83667),
            tabs: [
              Tab(icon: Icon(Icons.account_circle, color: Color(0xfff83667))),
              Tab(icon: Icon(Icons.assignment, color: Color(0xfff83667))),
              Tab(icon: Icon(Icons.visibility, color: Color(0xfff83667))),
            ],
          )
        ),
        body: TabBarView(
          children: [
            businessCard(),
            resume(),
            _predictor(),
          ],
        )
      )
    );
  }
}
