import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Good Morning',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Monday, Jan 25th 2021',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 32),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'New York...',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[200],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '11:34 PM',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue[200],
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        '22',
                        style: TextStyle(
                          fontSize: 128,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[200],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '°',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.blue[200],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -32,
                  child: Icon(
                    Icons.cloud,
                    size: 96,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: -64,
                  right: -32,
                  child: Icon(
                    Icons.brightness_high,
                    size: 48,
                    color: Colors.yellow[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'TIP: Take a walk, go to the gym.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}