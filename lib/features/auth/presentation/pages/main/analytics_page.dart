import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/app_bar.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        hasBackButton: false,
        fieldText: 'Analytics',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            WeeklyAnalyticsCard(),
            SizedBox(height: 16),
            StreakStatsRow(),
            SizedBox(height: 16),
            SessionCard(),
          ],
        ),
      ),
    );
  }
}

class WeeklyAnalyticsCard extends StatelessWidget {
  const WeeklyAnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: BodyPadding.medium,
      decoration: BoxDecoration(
        color: AppColor.silver,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColor.transparent,
                  border: Border.all(color: AppColor.primary500, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'This week',
                      style: FontStyles.bodyMedium.copyWith(
                        color: AppColor.primary500,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.keyboard_arrow_down, size: 20),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      reservedSize: 35,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}m',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColor.greyscale700,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const days = [
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri',
                          'Sat',
                          'Sun'
                        ];
                        if (value.toInt() < 0 || value.toInt() >= days.length) {
                          return const Text('');
                        }
                        // Prevent duplicate labels
                        if (meta.min == value ||
                            days[value.toInt()] != days[value.toInt() - 1]) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              days[value.toInt()],
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColor.greyscale700,
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                      reservedSize: 30,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 45),
                      FlSpot(1, 20),
                      FlSpot(2, 35),
                      FlSpot(3, 40),
                      FlSpot(4, 35),
                      FlSpot(5, 45),
                      FlSpot(6, 50),
                    ],
                    isCurved: true,
                    gradient: const LinearGradient(
                      colors: [AppColor.primary300, AppColor.primary300],
                    ),
                    barWidth: 5,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          AppColor.greyscale700.withOpacity(0.3),
                          AppColor.primary300.withOpacity(0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StreakStatsRow extends StatelessWidget {
  const StreakStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard('12d', 'current streak'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard('16d', 'longest streak'),
        ),
      ],
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.silver,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: FontStyles.heading3.copyWith(
              color: AppColor.primary400,
            ),
          ),
          Text(
            label,
            style: FontStyles.bodyMedium.copyWith(
              color: AppColor.greyscale700,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  const SessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.silver,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '45',
            style: FontStyles.heading3.copyWith(
              color: AppColor.primary400,
            ),
          ),
          Text(
            'sessions watched',
            style: FontStyles.bodyMedium.copyWith(
              color: AppColor.greyscale700,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
