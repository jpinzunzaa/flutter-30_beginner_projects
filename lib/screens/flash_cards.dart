import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashCard {
  final String question;
  final String answer;

  const FlashCard({
    required this.question,
    required this.answer,
  });
}

class FlashCardView extends StatelessWidget {
  final String text;

  const FlashCardView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            )
          )
        ),
      )
    );
  }
}

class FlashCards extends StatefulWidget {
  const FlashCards({ Key? key }) : super(key: key);

  @override
  State<FlashCards> createState() => FlashCardsState();
}

class FlashCardsState extends State<FlashCards> {
  final List<FlashCard> _flashcards = const [
    FlashCard(question: 'hola', answer: 'mundo'),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flashcards'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashCardView(text: _flashcards[_currentIndex].question),
                  back: FlashCardView(text: _flashcards[_currentIndex].answer),
                ),
              ),
              const SizedBox(height: 20),
              buildNavigationButtons(),
            ],
          ),
        )
      )
    );
  }

  Widget buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton.icon(
          onPressed: showPreviousCard,
          icon: const Icon(Icons.chevron_left),
          label: const Text('Prev'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
          ),
        ),
        OutlinedButton.icon(
          onPressed: showNextCard,
          icon: const Icon(Icons.chevron_right),
          label: const Text('Next'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)
          ),
        ),
      ]
    );
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
    });
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _flashcards.length) % _flashcards.length;
    });
  }
}