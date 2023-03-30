import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'Birthday Card',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Birthday Card'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
        ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image2.jpg'),
              const Text(
                'Happy Birthday !!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),

      ),
    ),
  );
}
