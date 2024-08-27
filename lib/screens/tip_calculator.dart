import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({ super.key });
  @override
  TipCalculatorState createState() => TipCalculatorState();
}

class TipCalculatorState extends State<TipCalculator> {
  final TextEditingController _controller = TextEditingController();
  final List<bool> _selection = [true, false, false];
  String? _tip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tip calculator')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_tip != null)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    _tip!,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                  )
                ),
              const Text('Total amount', style: TextStyle(fontSize: 18)),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: '\$100.00',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ToggleButtons(
                  isSelected: _selection,
                  onPressed: _updateSelection,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('10%'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('15%'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text('20%'),
                    )
                  ],
                )
              ),
              ElevatedButton(
                onPressed: _calculateTip,
                child: Text('Calculate tip'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                )
              )
            ]
          )
        ),
      )
    );
  }
  void _updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = i == selectedIndex;
      }
    });
  }

  void _calculateTip() {
    final totalAmount = double.tryParse(_controller.text) ?? 0.0;
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];
    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);
    setState(() {
      _tip = '\$$tipTotal';
    });
  }
}