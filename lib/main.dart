import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './HomePage.dart';
import 'about_app.dart';

void main() async {
  List currencies = await MyApp.getCurrencies();
  print(currencies.toString());
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;

  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePage(_currencies),
      routes: <String, WidgetBuilder>{
        "/AboutApp": (BuildContext context) => new AboutApp(),
      },
    );
  }

  static Future<List> getCurrencies() async {
    String cryptoURL = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response = await http.get(cryptoURL);
    return json.decode(response.body);
  }
}
