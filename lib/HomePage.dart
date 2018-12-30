import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.red, Colors.blue, Colors.teal];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "CryptoRates",
          style: TextStyle(
              fontFamily: 'Pacifico',
              letterSpacing: 1.65,
              color: Color(0xffffe0e0e0)),
        ),
        backgroundColor: Color(0xFFFF1a1a1a),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.info),
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFFFF1a1a1a),
        elevation: 30.0,
        onPressed: null,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Container(
          height: 60.0,
          color: Color(0xFFFF1a1a1a),
        ),
      ),
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("CryptoRates",
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 32.0,
                        color: Color(0xffffe0e0e0))),
                accountEmail: null,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/background.jpg'))),
              ),
              new ListTile(
                leading: Icon(Icons.info),
                title: new Text("App info"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/AboutApp");
                },
              ),
              new Divider(),
              new ListTile(
                leading: Icon(Icons.close),
                title: new Text("Close"),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          )),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Stack(children: <Widget>[
          new Positioned.fill(
            child: new Image(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          new Column(
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  itemCount: widget.currencies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Map currency = widget.currencies[index];
                    final MaterialColor color = _colors[index % _colors.length];

                    return Card(child: _getListItemUi(currency, color));
                  },
                ),
              )
            ],
          )
        ]));
  }

  ListTile _getListItemUi(Map currency, MaterialColor color) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency['name'][0]),
      ),
      title: new Text(currency['name'],
          style: new TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(
          currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUsd, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUsd\n", style: new TextStyle(color: Colors.black));
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
