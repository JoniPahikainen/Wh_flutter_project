import 'package:flutter/material.dart';
import 'package:uusiaa/theme/theme_constants.dart';
import 'package:uusiaa/theme/theme_manager.dart';

import 'HomePage.dart';
// import 'package:uusiaa/utils/helper_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
