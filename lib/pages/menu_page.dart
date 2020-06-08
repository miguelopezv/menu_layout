import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            _bgMenu(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[_mainText(), _cards()],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
        selectedItemColor: Colors.pinkAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            title: Container(),
          )
        ],
      ),
    );
  }

  Widget _bgMenu() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0, 0.6),
          end: FractionalOffset(0, 1),
          colors: [
            Color.fromRGBO(52, 54, 101, 1),
            Color.fromRGBO(35, 37, 57, 1)
          ],
        ),
      ),
    );

    final pinkBox = Transform.rotate(
      angle: -pi / 5,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1)
            ])),
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          top: -100,
          left: -50,
          child: pinkBox,
        ),
      ],
    );
  }

  Widget _mainText() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify Transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Classify this transaction into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cards() {
    return Table(
      children: [
        TableRow(children: [
          _card(Colors.blue, Icons.border_all, 'General'),
          _card(Colors.purpleAccent, Icons.directions_bus, 'Transport'),
        ]),
        TableRow(children: [
          _card(Colors.pinkAccent, Icons.shop, 'Entertaiment'),
          _card(Colors.orange, Icons.insert_drive_file, 'Office'),
        ]),
        TableRow(children: [
          _card(Colors.blueAccent, Icons.movie_filter, 'Movies'),
          _card(Colors.green, Icons.cloud, 'Services'),
        ]),
        TableRow(children: [
          _card(Colors.red, Icons.collections, 'Vacation'),
          _card(Colors.teal, Icons.help_outline, 'Others'),
        ]),
      ],
    );
  }

  Widget _card(Color color, IconData icon, String text) {
    return Container(
      height: 180,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                radius: 35,
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                text,
                style: TextStyle(color: color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
