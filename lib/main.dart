import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_30_beginner_projects/screens/basic_layout.dart';
import 'package:flutter_30_beginner_projects/screens/easy_read.dart';
import 'package:flutter_30_beginner_projects/screens/flash_cards.dart';
import 'package:flutter_30_beginner_projects/screens/picture_carousel.dart';
import 'package:flutter_30_beginner_projects/screens/restaurant_picker.dart';
import 'package:flutter_30_beginner_projects/screens/tip_calculator.dart';
import 'package:flutter_30_beginner_projects/screens/todo_list_firebase.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: TodoListPage(),
    );
  }
}