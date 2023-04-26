import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _time = '';
  String _location = '';

  AccelerometerEvent _accelerometerEvent = AccelerometerEvent(0.0, 0.0, 0.0);
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initSensors();
  }

  @override
  void dispose() {
    _stopSensors();
    super.dispose();
  }

  void _initSensors() {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerEvent = event;
        _checkForAccident();
      });
    });
  }

  void _stopSensors() {
    _accelerometerSubscription?.cancel();
  }

  void _checkForAccident() async {
    if (_isRecording) {
      return;
    }
    final double threshold = 1.0;
    final double normOfG = _accelerometerEvent.x * _accelerometerEvent.x +
        _accelerometerEvent.y * _accelerometerEvent.y +
        _accelerometerEvent.z * _accelerometerEvent.z;
    if (normOfG < threshold * threshold) {
      _isRecording = true;

      var permissionStatus = await Permission.location.request();
      if (permissionStatus.isGranted) {
        final Position position = await Geolocator.getCurrentPosition();
        final String time =
            DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now());
        final String locationString =
            'Lat: ${position.latitude}, Long: ${position.longitude}';
        setState(() {
          _time = time;
          _location = locationString;
        });
        _isRecording = false;
        _showDialog(time, locationString);
      } else {
        print('Location permission denied');
      }
    }
  }

  void _showDialog(String time, String locationString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Accident Detected'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('An accident was detected at $time.'),
                SizedBox(height: 8.0),
                Text('Location: $locationString'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  _time = time;
                  _location = locationString;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _detectAccident() async {
    if (_isRecording) {
      return;
    }
    _isRecording = true;
    var permissionStatus = await Permission.location.request();
    if (permissionStatus.isGranted) {
      final Position position = await Geolocator.getCurrentPosition();
      final String time =
          DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now());
      final String locationString =
          'Lat: ${position.latitude}, Long: ${position.longitude}';
      // Save the time and location data to a database or cloud storage
      print('Accident detected at $time, location: $locationString');
      setState(() {
        _time = time;
        _location = locationString;
      });
      _isRecording = false;
      _showDialog(time, locationString);
    } else {
      print('Location permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Accident Detection'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Accelerometer Data:',
              ),
              SizedBox(height: 16.0),
              Text(
                _accelerometerEvent != null
                    ? 'X: ${_accelerometerEvent.x.toStringAsFixed(6)}, Y: ${_accelerometerEvent.y.toStringAsFixed(6)}, Z: ${_accelerometerEvent.z.toStringAsFixed(6)}'
                    : 'No data yet',
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _detectAccident,
                child: Text('Detect Accident'),
              ),
              SizedBox(height: 16.0),
              Text(
                _time.isNotEmpty ? 'Time: $_time' : '',
              ),
              SizedBox(height: 16.0),
              Text(
                _location.isNotEmpty ? 'Location: $_location' : '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
