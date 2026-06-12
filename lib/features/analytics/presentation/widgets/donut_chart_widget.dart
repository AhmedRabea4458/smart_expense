import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/analytics/data/models/chart_model.dart';



class DonutChartWidget extends StatelessWidget {
  final List<CategoryBreakdown> categories;
  final double totalAmount;
  final String totalLabel;

  const DonutChartWidget({
    super.key,
    required this.categories,
    required this.totalAmount,
    this.totalLabel = 'إجمالي الإنفاق',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Pie Chart
        SizedBox(
          width: 126,
          height: 126,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 40,
              sectionsSpace: 2,
              startDegreeOffset: 270,
              sections: _buildSections(),
            ),
          ),
        ),
        // Center text
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              totalLabel,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.mutedForeground,
              ),
            ),
            const SizedBox(height: AppSpacing.space1),
            Text(
              '$totalAmount',
              style: AppTextStyles.body.copyWith(
                color: AppColors.foreground,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildSections() {
    return categories.map((category) {
      return PieChartSectionData(
        color: category.color,
        value: category.value,
        radius: 25,
        title: '',
        showTitle: false,
      );
    }).toList();
  }
}
