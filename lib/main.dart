import 'package:flutter/material.dart';
import 'package:flutter_30_beginner_projects/screens/restaurant_picker.dart';


void main() {
  runApp(MyApp());
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
      home: RestaurantPicker(),
    );
  }
}