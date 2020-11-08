import 'package:flutter/material.dart';

Widget _resumePersonalInfo() {
  return Container(
    child: Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(child: Text('Garrett Gunnell', style: TextStyle(fontSize: 18.0)), alignment: Alignment.centerLeft),
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

Widget resume() {
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