import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.restaurant),
          title: Text('Restaurant 1'),
          subtitle: Text('Description of Restaurant 1'),
          onTap: () {
            // Handle tap on this list item
          },
        ),
        ListTile(
          leading: Icon(Icons.restaurant),
          title: Text('Restaurant 2'),
          subtitle: Text('Description of Restaurant 2'),
          onTap: () {
            // Handle tap on this list item
          },
        ),
        // Add more ListTiles for additional items
      ],
    );
  }
}


