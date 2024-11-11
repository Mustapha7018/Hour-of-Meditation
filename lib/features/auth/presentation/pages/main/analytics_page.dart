import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/display_card.dart';

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
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '4h 20m ',
                            style: FontStyles.heading3.copyWith(
                              color: AppColor.primary400,
                            ),
                          ),
                          TextSpan(
                            text: 'of total time spent this week',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'This week',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Line chart
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                            return Text(
                              days[value.toInt()],
                              style: TextStyle(color: Colors.black54),
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
                              style: TextStyle(color: Colors.black54),
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
                          FlSpot(0, 10),
                          FlSpot(1, 30),
                          FlSpot(2, 20),
                          FlSpot(3, 40),
                          FlSpot(4, 35),
                          FlSpot(5, 60),
                          FlSpot(6, 50),
                        ],
                        isCurved: true,
                        color: Colors.blue.shade400,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.blue.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Statistics cards in a grid layout
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return CustomCard(
                        title: '12d',
                        description: 'current streak',
                      );
                    case 1:
                      return CustomCard(
                        title: '16d',
                        description: 'longest streak',
                      );
                    case 2:
                      return CustomCard(
                        title: '45',
                        description: 'sessions watched',
                      );
                    default:
                      return Container(); // Should not reach here
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
