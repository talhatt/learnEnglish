import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Page();
  }
}

class Page extends State<Quiz> {
  bool _loading;
  double _progressValue;

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(height: 50),
        // buildSpeakerandWord(),
        SizedBox(height: 30),
        Center(
          child: buildQuestionCard(),
        )
      ],
    ));
  }

  Widget buildSpeakerandWord() {
    return Row(children: <Widget>[
      LinearProgressIndicator(
          backgroundColor: Colors.blue[400],
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue[700]),
          value: _progressValue),
      Text('1/16', style: TextStyle(color: Colors.blue, fontSize: 14))
    ]);
  }

  Widget buildQuestionCard() {
    return SizedBox(
        width: 350,
        child: Card(
            child: Column(children: <Widget>[
          GestureDetector(
              onTap: () {},
              child: Image.asset(
                'images/speaker.png',
                height: 64,
                width: 64,
              )),
          SizedBox(height: 30),
          Text('run',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
          SizedBox(height: 30),
          ButtonTheme(
              buttonColor: Colors.grey[200],
              minWidth: 300,
              height: 55,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Yeniden Başlamak',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              )),
          SizedBox(height: 30),
          ButtonTheme(
              buttonColor: Colors.grey[200],
              minWidth: 300,
              height: 55,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Yeniden Başlamak',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              )),
          SizedBox(height: 30),
          ButtonTheme(
              buttonColor: Colors.grey[200],
              minWidth: 300,
              height: 55,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Yeniden Başlamak',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              )),
          SizedBox(height: 30),
          ButtonTheme(
              buttonColor: Colors.grey[200],
              minWidth: 300,
              height: 55,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Yeniden Başlamakkkkkkkkkkkkkkkk',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              )),
          SizedBox(height: 50)
        ])));
  }
}
