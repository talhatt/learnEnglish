import 'package:flutter/material.dart';

class Workingpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Page();
  }
}

class Page extends State<Workingpage> {
  bool isSwitched = false;

  List<List<String>> wordList = new List();

  List<Widget> generateWidgetList() {
    List<Widget> w = new List(wordList.length);

    for (var i = 0; i < w.length; i++) {
      if (i % 2 == 0)
        w[i] = buildWord(wordList[i][0], wordList[i][1], Colors.white);
      else
        w[i] = buildWord(wordList[i][0], wordList[i][1], Colors.grey[200]);
    }

    return w;
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = ['dog', 'köpek'];
    List<String> list2 = ['cat', 'kedi'];
    List<String> list3 = ['chicken', 'tavuk'];
    List<String> list4 = ['parrot', 'papağan'];

    wordList.add(list);
    wordList.add(list2);
    wordList.add(list3);
    wordList.add(list4);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
              flex: 4,
              child: Align(
                  alignment: Alignment.center,
                  child: Column(children: <Widget>[
                    Image.asset(
                      'images/vegetable.png',
                      height: 64,
                      width: 64,
                    ),
                    Text('Bu unitede çalışılacak 10 kelime var')
                  ]))),
          Flexible(
            flex: 1,
            child: Container(
              color: Color.fromARGB(255, 237, 237, 237),
              child: Row(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Öğrenilen kelimeleri gizle'))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(flex: 12, child: Column(children: generateWidgetList()))
        ],
      ),
    );
  }

  Widget buildWord(String word, String turkishWord, Color color) {
    return Container(
        color: color,
        child: Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 3, top: 2),
                child: Image.asset(
                  'images/wordicon.png',
                  height: 24,
                  width: 24,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 2),
                  child: Text(
                    word,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10, top: 2),
                    child: Text(
                      turkishWord,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )),
                SizedBox(height: 6)
              ],
            )
          ],
        ));
  }
}
