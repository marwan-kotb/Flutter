import 'package:flutter/material.dart';

class ScoreCounter extends StatefulWidget {
  @override
  _ScoreCounterState createState() => _ScoreCounterState();
}

class _ScoreCounterState extends State<ScoreCounter> {
  int homeScore = 0;
  int awayScore = 0;

  void _addPoints(String team, int points) {
    setState(() {
      if (team == "home") {
        homeScore += points;
      } else if (team == "away") {
        awayScore += points;
      }
    });
  }

  void _resetScores() {
    setState(() {
      homeScore = 0;
      awayScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketball Score Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TEAM A: $homeScore',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 16),
            Text(
              'TEAM B: $awayScore',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _addPoints("home", 1),
                  child: Text('1 Point'),
                ),
                ElevatedButton(
                  onPressed: () => _addPoints("home", 2),
                  child: Text('2 Points'),
                ),
                ElevatedButton(
                  onPressed: () => _addPoints("home", 3),
                  child: Text('3 Points'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _addPoints("away", 1),
                  child: Text('1 Point'),
                ),
                ElevatedButton(
                  onPressed: () => _addPoints("away", 2),
                  child: Text('2 Points'),
                ),
                ElevatedButton(
                  onPressed: () => _addPoints("away", 3),
                  child: Text('3 Points'),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _resetScores,
              child: Text('Reset Scores'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basketball Score Counter',
      home: ScoreCounter(),
    );
  }
}
