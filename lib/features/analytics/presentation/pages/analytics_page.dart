import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/analytics/presentation/widgets/analytics_chart_card.dart';
import 'package:smart_expense/features/analytics/presentation/widgets/donut_chart_widget.dart';
import 'package:smart_expense/features/analytics/presentation/widgets/legend_item.dart';
import 'package:smart_expense/features/analytics/presentation/widgets/line_chart_card.dart';
import 'package:smart_expense/features/analytics/presentation/widgets/period_segmented_control.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top breathing room
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                  vertical: AppSpacing.space4,
                ),
                child: Text(
                  textDirection: TextDirection.rtl,
                  'التحليلات',
                  style: AppTextStyles.display.copyWith(
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: PeriodSegmentedControl(
                  selectedPeriod: 'شهر',
                  onChanged: (period) {
                    debugPrint(period);
                  },
                ),
              ),
            ),
            // Line Chart Card
            SliverToBoxAdapter(
              child: LineChartCard(
                spots: const [
                  FlSpot(0, 1200),
                  FlSpot(1, 1850),
                  FlSpot(2, 1600),
                  FlSpot(3, 2400),
                  FlSpot(4, 2100),
                  FlSpot(5, 2847),
                ],
                totalAmount: '٢,٨٤٧',
                comparisonLabel: 'مقارنة بالشهر الماضي',
                comparisonPercentage: '٨.٥٪',
                isIncrease: false,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.space6)),
            // Expense Breakdown Card
            SliverToBoxAdapter(child: AnalyticsChartCard()),
            // Bottom padding
            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.space8)),
          ],
        ),
      ),
    );
  }
}
