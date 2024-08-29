import 'package:flutter/material.dart';

class EasyRead extends StatefulWidget {
  const EasyRead({ super.key });
  @override
  EasyReadState createState() => EasyReadState();
}

class EasyReadState extends State<EasyRead> {
  double _fontSize = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic font size'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: _fontSize),
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your text here',
                  ),
                )
              )
            ),
            Slider(
              value: _fontSize,
              onChanged: (newSize) {
                setState(() => _fontSize = newSize);
              },
              min: 30,
              max: 200,
              divisions: 170,
              label: '${_fontSize.round()}',
            ),
            const SizedBox(height: 20),
          ],
        )
      )
    );
  }
}