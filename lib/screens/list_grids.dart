import 'package:flutter/material.dart';

class ListGrids extends StatelessWidget {
  const ListGrids({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List and grids')
      ),
      body: const Column(
        children: [
          Lists(),
        ]
      )
    );
  }
}

class Lists extends StatelessWidget {
  const Lists({ super.key });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map')
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album')
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone')
        )
      ]
    );
  }
}