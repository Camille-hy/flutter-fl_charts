import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartExample extends StatefulWidget {
  const BarChartExample();

  @override
  State<BarChartExample> createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bar Chart')),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.6,
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData,
              borderData: borderData,
              barGroups: barGroups,
              gridData: const FlGridData(show: false),
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
            ),
          ),
        ),
      )
      );
    }

    BarTouchData get barTouchData => BarTouchData(
      // enabled: true,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 6,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            const TextStyle(
              color: Color.fromRGBO(50, 24, 201, 1),
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

    Widget getTitles(double value, TitleMeta meta) {
      final style = TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      String text;
      switch (value.toInt()) {
        case 0:
          text = 'Mn';
          break;
        case 1:
          text = 'Te';
          break;
        case 2:
          text = 'Wd';
          break;
        case 3:
          text = 'Tu';
          break;
        case 4:
          text = 'Fr';
          break;
        case 5:
          text = 'St';
          break;
        case 6:
          text = 'Sn';
          break;
        default:
          text = '';
          break;
      }
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 4,
        child: Text(text, style: style),
      );
    }

    FlTitlesData get titlesData => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

    FlBorderData get borderData => FlBorderData(
        show: false,
      );

    LinearGradient get _barsGradient => LinearGradient(
      colors: [
        Colors.blueAccent,
        Colors.redAccent,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

    List<BarChartGroupData> get barGroups => [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            width: 10,
            toY: 8,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            width: 10,
            toY: 10,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            width: 10,
            toY: 14,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            width: 10,
            toY: 15,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            width: 10,
            toY: 13,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            width: 10,
            toY: 10,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            width: 10,
            toY: 16,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [0],
      ),
    ];
}