import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Buypage extends StatelessWidget {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo('Vegetables', "Buy ", 'images/vegetable.png'),
    PlaceInfo('Cars', "Buy", 'images/wheel.png'),
    PlaceInfo('Animals', "Buy", 'images/animal.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
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
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String des;
  final String image;
  PlaceInfo(this.name, this.des, this.image);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader =
        ui.Gradient.linear(Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(
        startColor,
      ).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
