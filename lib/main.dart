import 'package:flutter/material.dart';
import 'package:flutter_30_beginner_projects/screens/basic_layout.dart';
import 'package:flutter_30_beginner_projects/screens/easy_read.dart';
import 'package:flutter_30_beginner_projects/screens/flash_cards.dart';
import 'package:flutter_30_beginner_projects/screens/picture_carousel.dart';
import 'package:flutter_30_beginner_projects/screens/restaurant_picker.dart';
import 'package:flutter_30_beginner_projects/screens/tip_calculator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BasicLayout(),
    );
  }
}