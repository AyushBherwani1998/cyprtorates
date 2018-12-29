import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Color(0xFFFF1a1a1a),
          title: new Text("About App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  letterSpacing: 1.65,
                  color: Color(0xffffe0e0e0)))),
      body: new Stack(children: <Widget>[
        new Positioned.fill(
          child: new Image(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        new Center(
            child: Card(
          margin: const EdgeInsets.all(30.0),
          child: new Text(
            "CryptoRates",
            style: TextStyle(background: null),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ))
      ]),
    );
  }
}
