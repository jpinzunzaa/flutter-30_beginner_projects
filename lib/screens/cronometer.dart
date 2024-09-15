import 'dart:async';
import 'package:flutter/material.dart';

class Cronometer extends StatefulWidget {
  const Cronometer({ super.key });

  @override
  CronometerState createState() => CronometerState();
}

class CronometerState extends State<Cronometer> {
  late Timer _timer;
  int _seconds = 0;
  bool _isRunning = false;

  void _startTimer() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    if (!_isRunning) return;
    _timer.cancel();
    _isRunning = false;
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 0;
    });
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cronómetro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(_seconds),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: const Text('Iniciar')
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: const Text('Detener')
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text('Reiniciar')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}