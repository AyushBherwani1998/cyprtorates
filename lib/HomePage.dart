import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
//  final List currencies;
//  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _currencies;
  final List<MaterialColor> _colors = [Colors.red, Colors.blue, Colors.teal];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("CryptoRates")),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Column(children: <Widget>[
      new Flexible(
        child: new ListView.builder(
            itemCount: _currencies.length,
            itemBuilder: (BuildContext context, int index) {
              final int i = index ~/ 2;
              final Map currency = _currencies[i];
              final MaterialColor color = _colors[i % _colors.length];
              return _getListItemUI(currency, color);
            }),
      )
    ]));
  }

  ListTile _getListItemUI(Map currency, MaterialColor color) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency['name'][0]),
      ),
      title: new Text(
        currency['name'],
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(
          currency['price_usd'], currency['percent_change-1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUsd, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUsd", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1hour: $percentageChange";
    TextSpan percentageChangeTextWidget;
    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }
    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }
}
