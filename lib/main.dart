import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Call Me Maybe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  Widget _businessCard() {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(child: Image(image: AssetImage('images/me.png'), height: 100, width: 100), padding: const EdgeInsets.all(12.0)),
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Center(child: Text(widget.title, textAlign: TextAlign.center)),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_car)),
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
