import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 2500), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => Loginscreen(),
          ));
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/1.png'), fit: BoxFit.cover),
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue[300]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Text(
                'İngilizce Dünyası',
                style: TextStyle(
                    fontFamily: 'Camar', color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 260, child: Image(image: AssetImage('images/2.png'))),
              SizedBox(
                height: 15,
              ),
              Text(
                'Daha Hızlı Kelime Öğrenin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
