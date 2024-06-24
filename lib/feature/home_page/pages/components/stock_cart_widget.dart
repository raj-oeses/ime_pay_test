import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ime_pay_test/core/utils/colors.dart';
import 'package:ime_pay_test/core/utils/date_time_formatter.dart';

import '../../data/model/share_data_model.dart';

class StockChart extends StatelessWidget {
  final List<Datum>? dataList;

  const StockChart({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LineChart(LineChartData(
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      spots: [
                        if (dataList != null && dataList!.isNotEmpty)
                          ...dataList!.map((element) => FlSpot(
                              double.parse(
                                  dataList!.indexOf(element).toString()),
                              element.index ?? 0.0))
                      ],
                      isCurved: false,
                      color: greenColor,
                      barWidth: 1,
                      isStrokeCapRound: true)
                ],
                lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (List<LineBarSpot> touchedSpots) =>
                            touchedSpots
                                .map((touchedSpot) => LineTooltipItem(
                                      '${DateTimeFormatter.formatMDYT(dataList?[touchedSpot.x.toInt()].date)}',
                                      const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ))
                                .toList()),
                    handleBuiltInTouches: true)))));
  }
}
