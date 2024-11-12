import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:result_creater/constants/buttons/dynamic_button.dart';
import 'package:result_creater/constants/fade_in_animation.dart';

class ResultScreen extends StatefulWidget {
  final int a;
  final int b;
  final int c;
  final int d;
  final int f;
  final int total;

  ResultScreen({
    super.key,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.f,
    required this.total,
  }) {
    log("Values: a=$a, b=$b, c=$c, d=$d, f=$f, total=$total");
  }

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String calculatePercentage(double total, double received) {
    if (total == 0) return "0.00"; // Avoid division by zero
    double percentage = (received / total) * 100;
    return percentage.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result Screen",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            FadeInAnimation(
              delay: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Percentage of grade distribution are : ",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "As  : ${calculatePercentage(widget.total.toDouble(), widget.a.toDouble())}%",
                    ),
                    Text(
                      "Bs : ${calculatePercentage(widget.total.toDouble(), widget.b.toDouble())}%",
                    ),
                    Text(
                      "Cs : ${calculatePercentage(widget.total.toDouble(), widget.c.toDouble())}%",
                    ),
                    Text(
                      "Ds  : ${calculatePercentage(widget.total.toDouble(), widget.d.toDouble())}%",
                    ),
                    Text(
                      "Fs : ${calculatePercentage(widget.total.toDouble(), widget.f.toDouble())}%",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: FadeInAnimation(
                delay: 1.5,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: widget.total > 0
                        ? widget.total.toDouble()
                        : 1.0, // Safe fallback for maxY
                    barGroups: _createBarGroups(),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const groups = ['A', 'B', 'C', 'D', 'F'];
                            if (value.toInt() < groups.length) {
                              return Text(groups[value.toInt()]);
                            } else {
                              return Text('');
                            }
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: true, reservedSize: 40.h),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: true),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            FadeInAnimation(
              delay: 2,
              child: DynamicButton.fromText(
                text: "Compute another Result",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    final studentData = [widget.a, widget.b, widget.c, widget.d, widget.f];
    for (int i = 0; i < studentData.length; i++) {
      log("Student data for group ${[
        'A',
        'B',
        'C',
        'D',
        'F'
      ][i]}: ${studentData[i]}");
    }
    return List.generate(
      studentData.length,
      (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: studentData[index].toDouble(),
            color: Colors.blueAccent,
            width: 20,
          ),
        ],
      ),
    );
  }
}
