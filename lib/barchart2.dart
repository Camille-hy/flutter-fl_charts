import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChart2Example extends StatefulWidget {
  const BarChart2Example({super.key});

  @override
  State<BarChart2Example> createState() => _BarChart2ExampleState();
}

class _BarChart2ExampleState extends State<BarChart2Example> {
  final Color upper = Colors.red;
  final Color lower = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bar Chart 2'),
        ),
        body: AspectRatio(
          aspectRatio: 1.66,
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: LayoutBuilder(builder: (context, constraints) {
              final barsWidth = 12.0 * constraints.maxWidth / 400;
              return BarChart(BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 10 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    strokeWidth: 1,
                  ),
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                
                barGroups: getData(barsWidth),
                groupsSpace: 50,
              )
            );
          }
          ),
        ),
      )
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Apr';
        break;
      case 1:
        text = 'May';
        break;
      case 2:
        text = 'Jun';
        break;
      case 3:
        text = 'Jul';
        break;
      case 4:
        text = 'Aug';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(meta.formattedValue, style: style),
    );
  }

  List<BarChartGroupData> getData(double barsWidth) {
    return [
      BarChartGroupData(x: 0, barRods: [
        BarChartRodData(
          toY: 17,
          rodStackItems: [
            BarChartRodStackItem(0, 10, lower),
            BarChartRodStackItem(10, 17, upper),
          ],
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        )
      ]),
      BarChartGroupData(x: 1, barRods: [
        BarChartRodData(
          toY: 20,
          rodStackItems: [
            BarChartRodStackItem(0, 18, lower),
            BarChartRodStackItem(18, 20, upper),
          ],
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        )
      ]),
      BarChartGroupData(x: 2, barRods: [
        BarChartRodData(
          toY: 17,
          rodStackItems: [
            BarChartRodStackItem(0, 15, lower),
            BarChartRodStackItem(15, 17, upper),
          ],
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        )
      ]),
      BarChartGroupData(x: 3, barRods: [
        BarChartRodData(
          toY: 30,
          rodStackItems: [
            BarChartRodStackItem(0, 25, lower),
            BarChartRodStackItem(25, 30, upper),
          ],
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        )
      ]),
      BarChartGroupData(x: 4, barRods: [
        BarChartRodData(
          toY: 19,
          rodStackItems: [
            BarChartRodStackItem(0, 15, lower),
            BarChartRodStackItem(15, 19, upper),
          ],
          borderRadius: BorderRadius.zero,
          width: barsWidth,
        )
      ]),
    ];
  }
}
