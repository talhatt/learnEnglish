import 'package:flutter/material.dart';
import 'package:hello/size_config.dart';

class Workingpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Page();
  }
}

class Page extends State<Workingpage> {
  bool isSwitched = false;
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
                flex: 4,
                child: Column(children: <Widget>[
                  SizedBox(height: 50),
                  Image.asset(
                    'images/vegetable.png',
                    height: 64,
                    width: 64,
                  ),
                  Text('Bu unitede çalışılacak 10 kelime var')
                ])),
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
                    Spacer(),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attachment),
            title: Text('Çalışma',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            title: Text('Quiz',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            title: Text('Test',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildWord(String word, String turkishWord, Color color) {
    return Card(
      color: color,
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset('images/wordicon.png'),
        ),
        title: Text(word),
        subtitle: Text(turkishWord),
      ),
    );
  }
}
