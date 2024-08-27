import 'package:flutter/material.dart';
import 'dart:math';

class RestaurantPicker extends StatefulWidget {
  const RestaurantPicker({ super.key });

  @override
  RestaurantPickerState createState() => RestaurantPickerState();
}

class RestaurantPickerState extends State<RestaurantPicker> {
  final List<String> restaurants = [
    'McDonald\'s',
    'Roscoe\'s Chicken & Waffles',
    'Olive Garden',
    'Pizza Hut',
    'Panda Express',
    'Subway'
  ];

  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant picker'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'What do you want to eat?',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              if (currentIndex != null)
                Text(
                  restaurants[currentIndex!],
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: updateIndex,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18)
                ),
                child: const Text('Pick restaurant'),
              )
            ],
          ),
        )
      )
    );
  }
  void updateIndex() {
    final random = Random();
    setState(() {
      currentIndex = random.nextInt(restaurants.length);
    });
  }
}
