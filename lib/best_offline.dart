import 'package:flutter/material.dart';

class Bestoffline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Spacer(),
      buildCupAndWord(),
      buildButtons(),
      Spacer()
    ]));
  }

  Widget buildCupAndWord() {
    return Column(children: <Widget>[
      Image.asset(
        'images/cup2.png',
        height: 128,
        width: 128,
      ),
      Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text('Sıralamya dahil olmak için şimdi Kaydol veya oturum aç',
              style: TextStyle(fontSize: 16)))
    ]);
  }

  Widget buildButtons() {
    return Row(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(left: 40, top: 40),
          child: ButtonTheme(
              buttonColor: Colors.blue,
              minWidth: 130,
              height: 40,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Kaydol',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ))),
      Spacer(),
      Padding(
          padding: EdgeInsets.only(right: 40, top: 40),
          child: ButtonTheme(
              buttonColor: Colors.blue,
              minWidth: 130,
              height: 40,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Oturum aç',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              )))
    ]);
  }
}
