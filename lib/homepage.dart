import 'package:flutter/material.dart';
import 'package:hello/drawer.dart';
import 'package:hello/myprofile_offline.dart';
import 'package:hello/subjects.dart';
import 'package:hello/workingpage.dart';

import 'customwidget/custom_card_shape_painter.dart';
import 'models/subjects.dart';

class Stateee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Homepage();
  }
}

class Homepage extends State<Stateee> {
  GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();
  final double _borderRadius = 24;
  int _selectedIndex = 0;
  var items = [
    PlaceInfo('Vegetables', "Learn Vetegable Names", 'images/vegetable.png'),
    PlaceInfo('Cars', "Learn Car Names", 'images/wheel.png'),
    PlaceInfo('Animals', "Learn Animal Names", 'images/animal.png')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//merhaba
  Widget showPage(int _selectedIndex) {
    if (_selectedIndex == 0) {
      return page1();
    } else if (_selectedIndex == 1) {
      return page2();
    } else if (_selectedIndex == 2) {
      return page3();
    } else
      return page1();
  }

  Widget page1() {
    return Container(
        child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (
        context,
        index,
      ) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_borderRadius),
                    gradient: LinearGradient(
                      colors: [Color(0xff6DC8F3), Color(0xff73A1F9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff73A1F9),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: CustomPaint(
                    size: Size(100, 150),
                    painter: CustomCardShapePainter(
                        _borderRadius, Color(0xff6DC8F3), Color(0xff73A1F9)),
                  ),
                ),
                Positioned.fill(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Image.asset(
                          items[index].image,
                          height: 64,
                          width: 64,
                        ),
                        flex: 2),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            items[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Avenir',
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            items[index].des,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Avenir',
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on,
                                  color: Colors.white, size: 16),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Some title text here',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '4.7',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        );
      },
    ));
  }

  Widget page2() {
    return Container(
        child: Center(
      child: Text("Profil"),
    ));
  }

  Widget page3() {
    return Container(
        child: Center(
      child: Text("En iyi"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      drawer: Drawer(
        child: DrawerBuilder(),
      ),
      appBar: AppBar(
        title: Text("Konularım"),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              scaffold.currentState.openDrawer();
            }),
      ),
      resizeToAvoidBottomInset: false,
      body: showPage(_selectedIndex),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => MyprofileOffline()));
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attachment),
            title: Text(
              'Çalışma',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(
              'Profil',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text(
              'En iyiler',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
