import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget _githubLink() {
  return Expanded(
    child: InkWell(
      child: Image(image: AssetImage('images/github.png'), height: 20, width: 20),
      onTap: () { launch('https://github.com/GarrettGunnell'); }
    )
  );
}

Widget _emailLink() {
  return Expanded(
    child: InkWell(
      child: Icon(Icons.mail, color: Color(0xffe5b3b2)),
      onTap: () { launch('mailto:gunnellg@oregonstate.edu'); }
    )
  );
}

Widget _phoneLink() {
  return InkWell(
    child: Text("(123) 456-7890", textAlign: TextAlign.center, style: TextStyle(fontSize: 17.0, color: Color(0xff99c2ac))),
    onTap: () { launch('sms:1234567890'); }
  );
}

Widget _pictureOfMe() {
  return Padding(
    child: Image(
    image: ExactAssetImage('images/me.png'),
      height: 210,
      width: 210
    ),
    padding: const EdgeInsets.only(top: 8.0)
  );
}

Widget businessCard() {
  return SingleChildScrollView(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _pictureOfMe(),
          Container(
            padding: const EdgeInsets.all(3.0),
            margin: const EdgeInsets.only(left: 7.0, right: 7.0, top: 7.0),
            child: Column(
              children: [
                Text('Garrett Gunnell', style: TextStyle(fontSize: 27.5, color: Color(0xff8fb3ab))),
                _phoneLink(),
                Padding(
                  child: Row(
                  children: <Widget>[
                    _githubLink(),
                    _emailLink(),
                  ],
                ),
                padding: const EdgeInsets.all(8.0)
              )],
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black),
              color: Color(0xff8b7e7c)
            )
          )
        ],
      ),
    ));
}