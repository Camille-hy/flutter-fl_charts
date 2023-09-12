import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:charts/widgets/indicator.dart';

class PieChartExample extends StatefulWidget {
  const PieChartExample({super.key});

  @override
  State<PieChartExample> createState() => _PieChartExampleState();
}

class _PieChartExampleState extends State<PieChartExample> {
  List<PieChartSectionData> pieChartSections = [];
  int touchedIndex = -1;

  // @override
  // void initState() {
  //   super.initState();

    // pieChartSections = [
    //   PieChartSectionData(
    //     value: 3,
    //     color: Color.fromRGBO(235, 231, 108, 1),
    //     title: '3',
    //     radius: 100,
    //   ),
    //   PieChartSectionData(
    //     value: 5,
    //     color: Color.fromRGBO(240, 184, 110, 1),
    //     title: '5',
    //     radius: 100,
    //   ),
    //   PieChartSectionData(
    //     value: 2,
    //     color: Color.fromRGBO(255, 127, 129, 1),
    //     title: '2',
    //     radius: 100,
    //   ),
    //   PieChartSectionData(
    //     value: 2,
    //     color: Color.fromRGBO(131, 96, 150, 1),
    //     title: '2',
    //     radius: 100,
    //   ),
    // ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PieChart')),
      body: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                      print(touchedIndex);
                    });
                  },
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: showingSections(),
              )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Indicator(
                  color: Color.fromRGBO(235, 231, 108, 1),
                  text: 'Burger',
                  isSquare: true,
                ),
                SizedBox(height: 4),
                Indicator(
                  color: Color.fromRGBO(240, 184, 110, 1),
                  text: 'Fries',
                  isSquare: true,
                ),
                SizedBox(height: 4),
                Indicator(
                  color: Color.fromRGBO(255, 127, 129, 1),
                  text: 'Apple Pie',
                  isSquare: true,
                ),
                SizedBox(height: 4),
                Indicator(
                  color: Color.fromRGBO(131, 96, 150, 1),
                  text: 'Nugget',
                  isSquare: true,
                ),
                SizedBox(height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 120.0 : 100.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color.fromRGBO(235, 231, 108, 1),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color.fromRGBO(240, 184, 110, 1),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color.fromRGBO(255, 127, 129, 1),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color.fromRGBO(131, 96, 150, 1),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
