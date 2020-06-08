import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/scroll_page.dart';
import './pages/menu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor:
            (Platform.isAndroid) ? Colors.transparent : Colors.white));

    return MaterialApp(
      title: 'Flutter Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => ScrollPage(),
        'menu': (BuildContext context) => MenuPage(),
      },
    );
  }
}
