import 'package:flutter/material.dart';
import 'package:cyprtorates/HomePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.tealAccent),
      home: new HomePage(),
    );
  }
}

Future<List> getCurrencies() async {
  String cryptoURL = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoURL);
  return json.decode(response.body);
}
