import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'First Application',
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Application'),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Text('Marwan Madmouh Kotb Mohamed'),
        ),
      ),
    ),
  );
}
