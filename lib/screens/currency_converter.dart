import 'package:flutter/material.dart';

class CurrencyConverter {
  static Map<String, double> exchangeRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'JPY': 110.0,
    'GBP': 0.76,
  };

  double convert(double amount, String fromCurrency, String toCurrency) {
    double fromRate = exchangeRates[fromCurrency] ?? 1.0;
    double toRate = exchangeRates[toCurrency] ?? 1.0;
    return (amount / fromRate) * toRate;
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});
  @override
  CurrencyConverterState createState() => CurrencyConverterState();
}

class CurrencyConverterState extends State<CurrencyConverterScreen> {
  final TextEditingController controller = TextEditingController();
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  String result = '';

  void convertCurrency() {
    double amount = double.tryParse(controller.text) ?? 0.0;
    if (amount > 0) {
      CurrencyConverter converter = CurrencyConverter();
      double convertedAmount =
          converter.convert(amount, fromCurrency, toCurrency);
      setState(() {
        result =
            '$amount $fromCurrency = ${convertedAmount.toStringAsFixed(2)} $toCurrency';
      });
    } else {
      setState(() {
        result = 'Por favor, ingrese una cantidad válida.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad'),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: fromCurrency,
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    fromCurrency = value;
                  });
                }
              },
              items: CurrencyConverter.exchangeRates.keys
                  .map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: toCurrency,
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    toCurrency = value;
                  });
                }
              },
              items: CurrencyConverter.exchangeRates.keys
                  .map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: const Text('Convertir'),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
