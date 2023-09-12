import 'package:flutter/material.dart';
import 'package:charts/piechart.dart';
import 'package:charts/barchart.dart';
import 'package:charts/barchart2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Charts',
      home: MyHomePage(title: 'Charts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToPieChart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PieChartExample(),
      ),
    );
  }

  void navigateToBarChart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BarChartExample(),
      ),
    );
  }

  void navigateToBarChart2() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BarChart2Example(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => navigateToPieChart(),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(100, 100)),
              ),
              child: Text(
                'PieChart',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () => navigateToBarChart(),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(100, 100)),
              ),
              child: Text(
                'BarChart',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () => navigateToBarChart2(),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(100, 100)),
              ),
              child: Text(
                'BarChart2',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
