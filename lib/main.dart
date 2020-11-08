import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

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
      ),
      home: MyHomePage(title: 'Call Me Maybe'),
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

  Widget _githubLink() {
    return Expanded(
        child: RichText(
        text: TextSpan(
          text: "github.com/GarrettGunnell",
          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),          
          recognizer: TapGestureRecognizer()
          ..onTap = () async { launch('https://github.com/GarrettGunnell'); }
        ),
        textAlign: TextAlign.center,
      )
    );
  }

  Widget _emailLink() {
    return Expanded(child: Text('gunnellg@oregonstate.edu', textAlign: TextAlign.center));
  }

  Widget _pictureOfMe() {
    return Padding(
      child: Container(
          child: Image(
            image: AssetImage('images/me.png'),
            height: 200,
            width: 200
          ),
        ),
      padding: const EdgeInsets.only(top: 8.0)
    );
  }

  Widget _businessCard() {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _pictureOfMe(),
            Text('Garrett Gunnell', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            Text('(123) 456-7890'),
            Padding(
              child: Row(
                children: <Widget>[
                  _githubLink(),
                  _emailLink(),
                  ],
              ),
              padding: const EdgeInsets.all(8.0)
            ),
          ],
        ),
      );
  }

  Widget _resumePersonalInfo() {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(child: Text('Garrett Gunnell'), alignment: Alignment.centerLeft),
              Align(child: Text('gunnellg@oregonstate.edu'), alignment: Alignment.centerLeft),
              Align(child: Text('github.com/GarrettGunnell'), alignment: Alignment.centerLeft),
            ]
          )
        )
      )
    );
  }

  Widget _resumeWorkExperience() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(child: Text('Waiter', style: TextStyle(fontWeight: FontWeight.bold)), alignment: Alignment.centerLeft),
              Row(
                children: <Widget>[
                  Expanded(child: Text('Okawa')),
                  Expanded(child: Text('2016 - 2020', textAlign: TextAlign.center)),
                  Expanded(child: Text('Bend, OR', textAlign: TextAlign.right))
                ]
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
            ],
          )
        )
      )
    );
  }

  Widget _resume() {
    return Center(
      child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _resumePersonalInfo(),
                _resumeWorkExperience(),
                _resumeWorkExperience(),
                _resumeWorkExperience(),
                _resumeWorkExperience(),
                _resumeWorkExperience(),
                _resumeWorkExperience(),
                _resumeWorkExperience(),
                _resumeWorkExperience(),
              ]
            )
          ),
    );
  }

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


  void updateAnswer() {
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
        onTap: () {updateAnswer(); }
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
          Padding(child: Text("${_answers[_answerKey]}"), padding: EdgeInsets.only(top: 8.0))
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
          title: Center(child: Text(widget.title, textAlign: TextAlign.center)),
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
            _businessCard(),
            _resume(),
            _predictor(),
          ],
        )
      )
    );
  }
}
