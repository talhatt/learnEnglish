import 'package:flutter/material.dart';

import 'customwidget/custom_card_shape_painter.dart';
import 'models/subjects.dart';

class Subjects extends StatefulWidget {
  Subjects({Key key}) : super(key: key);

  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  var items = [
    PlaceInfo('Vegetables', "Learn Vetegable Names", 'images/vegetable.png'),
    PlaceInfo('Cars', "Learn Car Names", 'images/wheel.png'),
    PlaceInfo('Animals', "Learn Animal Names", 'images/animal.png')
  ];
  final double _borderRadius = 24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Çalışmak için bir konu ekle"),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (
          context,
          index,
        ) {
          return GestureDetector(
            onTap: () {},
            child: Center(
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
                        painter: CustomCardShapePainter(_borderRadius,
                            Color(0xff6DC8F3), Color(0xff73A1F9)),
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
            ),
          );
        },
      )),
    );
  }
}
