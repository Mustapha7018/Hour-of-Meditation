import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hom_app/core/widgets/buttons.dart';

import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/app_bar.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasBackButton: false,
        fieldText: 'Analytics',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total time and dropdown selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '4h 20m',
                          style: FontStyles.heading3.copyWith(
                            color: AppColor.primary400,
                          ),
                        ),
                        Text(
                          'of total time spent this week',
                          style: FontStyles.bodyMedium.copyWith(
                            color: AppColor.greyscale700,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomButton.outlined(
                    text: 'This week',
                    width: 150,
                    height: 45,
                    textStyle: FontStyles.bodyMedium.copyWith(
                      color: AppColor.primary500,
                    ),
                    icon: Image.asset('assets/icons/small_down_arrow.png'),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Line chart
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            const days = [
                              'Mon',
                              'Tue',
                              'Wed',
                              'Thu',
                              'Fri',
                              'Sat',
                              'Sun'
                            ];
                            return Text(
                              days[value.toInt()],
                              style: const TextStyle(color: Colors.black54),
                            );
                          },
                          interval: 1,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            return Text(
                              '${value.toInt()}m',
                              style: FontStyles.bodySmall.copyWith(
                                color: AppColor.greyscale500,
                              )
                            );
                          },
                          interval: 15,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 10),
                          const FlSpot(1, 30),
                          const FlSpot(2, 20),
                          const FlSpot(3, 40),
                          const FlSpot(4, 35),
                          const FlSpot(5, 60),
                          const FlSpot(6, 50),
                        ],
                        isCurved: true,
                        color: AppColor.primary300,
                        barWidth: 5,
                        belowBarData: BarAreaData(
                          show: true,
                          color: AppColor.greyscale200,
                        ),
                        dotData: FlDotData(show: false), // Remove dots from the line
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Statistics cards in a grid layout
              // GridView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio: 2,
              //     crossAxisSpacing: 16,
              //     mainAxisSpacing: 16,
              //   ),
              //   itemCount: 3,
              //   itemBuilder: (context, index) {
              //     switch (index) {
              //       case 0:
              //         return const CustomCard(
              //           title: '12d',
              //           description: 'current streak',

              //         );
              //       case 1:
              //         return const CustomCard(
              //           title: '16d',
              //           description: 'longest streak',
              //         );
              //       case 2:
              //         return const CustomCard(
              //           title: '45',
              //           description: 'sessions watched',
              //         );
              //       default:
              //         return Container();
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
