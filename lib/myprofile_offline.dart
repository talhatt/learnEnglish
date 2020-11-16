import 'package:flutter/material.dart';

class MyprofileOffline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Column(children: <Widget>[
            SizedBox(height: 80),
            buildProfilePicture(),
            SizedBox(height: 60),
            buildGain()
          ]),
        ),
        Flexible(flex: 2, child: buildStudiedTime())
      ],
    ));
  }

  Widget buildProfilePicture() {
    return Column(children: <Widget>[
      Image.asset(
        'images/profile3.png',
        height: 128,
        width: 128,
      ),
      SizedBox(height: 5),
      Text(
        'Kaydol veya oturum aç',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ]);
  }

  Widget buildGain() {
    return Row(children: <Widget>[
      Column(children: <Widget>[
        Row(children: <Widget>[
          Image.asset(
            'images/flag.png',
            height: 36,
            width: 36,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '0',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ]),
        Padding(
          padding: EdgeInsets.only(top: 5, left: 5),
          child: Text(
            'Kelime öğrendin',
            style: TextStyle(fontSize: 14),
          ),
        )
      ]),
      Spacer(),
      Column(children: <Widget>[
        Row(children: <Widget>[
          Image.asset(
            'images/cup.png',
            height: 36,
            width: 36,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '0',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ]),
        Padding(
          padding: EdgeInsets.only(top: 5, right: 5),
          child: Text(
            'Puan Topladın',
            style: TextStyle(fontSize: 14),
          ),
        )
      ]),
    ]);
  }

  Widget buildStudiedTime() {
    List<int> list = [0, 1, 0, 0, 0, 0, 1];

    return Column(children: <Widget>[
      Row(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(children: <Widget>[
              Text('2 dk',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Text('Bu hafta çalışma süren', style: TextStyle(fontSize: 14))
            ])),
        Spacer(),
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: Column(children: <Widget>[
              Text('2 gün',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Text('Aktif çalıştığın gün', style: TextStyle(fontSize: 14))
            ])),
      ]),
      Row(children: circleList(list))
    ]);
  }

  Widget generateCircle(String str, int i) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                str,
                height: 36,
                width: 36,
              )),
          Text(fetchDayName(i), style: TextStyle(fontSize: 14))
        ]));
  }

  List<Widget> circleList(List<int> list) {
    List<Widget> w = new List(list.length);

    for (var i = 0; i < list.length; i++) {
      if (list[i] == 0) {
        w[i] = generateCircle('images/x.png', i);
      } else {
        w[i] = generateCircle('images/tick.png', i);
      }
    }
    return w;
  }

  String fetchDayName(int i) {
    switch (i) {
      case 0:
        {
          return 'Pts';
        }
      case 1:
        {
          return 'Sal';
        }
      case 2:
        {
          return 'Çar';
        }
      case 3:
        {
          return 'Per';
        }
      case 4:
        {
          return 'Cum';
        }
      case 5:
        {
          return 'Cts';
        }
      case 6:
        {
          return 'Pzr';
        }
      default:
        {
          return 'Error';
        }
    }
  }
}
