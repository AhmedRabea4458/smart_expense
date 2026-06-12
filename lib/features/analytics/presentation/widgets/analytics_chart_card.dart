import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_radius.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/analytics/data/models/chart_model.dart';
import 'package:smart_expense/features/analytics/presentation/widgets/donut_chart_widget.dart';
import 'package:smart_expense/features/analytics/presentation/widgets/legend_item.dart';

class AnalyticsChartCard extends StatelessWidget {
  final EdgeInsets? padding;

  const AnalyticsChartCard({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      padding: padding ?? const EdgeInsets.all(AppSpacing.space6),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.heroCard),
        border: Border.all(color: AppColors.border50, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'تفصيل الإنفاق',
            style: AppTextStyles.headline.copyWith(color: AppColors.foreground),
          ),
          const SizedBox(height: AppSpacing.space6),
          // Row: Donut Chart + Legend
          Row(
            children: [
              // Donut Chart
             Expanded(
                child: Column(
                  children: [
                    LegendItem(
                      label: 'طعام',
                      amount: '١,١٥٠',
                      percentage: 40,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: AppSpacing.space3),
                    LegendItem(
                      label: 'مواصلات',
                      amount: '٦٨٠',
                      percentage: 24,
                      color: AppColors.warning,
                    ),
                    const SizedBox(height: AppSpacing.space3),
                    LegendItem(
                      label: 'فواتير',
                      amount: '٥٣٠',
                      percentage: 18,
                      color: const Color(0xFF2196F3),
                    ),
                    const SizedBox(height: AppSpacing.space3),
                    LegendItem(
                      label: 'تسوق',
                      amount: '٣٥٠',
                      percentage: 12,
                      color: AppColors.success,
                    ),
                    const SizedBox(height: AppSpacing.space3),
                    LegendItem(
                      label: 'أخرى',
                      amount: '١٤٧',
                      percentage: 6,
                      color: const Color(0xFF9C27B0),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.space4),
              // Legend
               DonutChartWidget(
                categories: [
                  CategoryBreakdown(
                    name: 'طعام',
                    value: 1150,
                    percentage: 40,
                    color: AppColors.primary,
                  ),
                  CategoryBreakdown(
                    name: 'مواصلات',
                    value: 680,
                    percentage: 24,
                    color: AppColors.warning,
                  ),
                  CategoryBreakdown(
                    name: 'فواتير',
                    value: 530,
                    percentage: 18,
                    color: const Color(0xFF2196F3),
                  ),
                  CategoryBreakdown(
                    name: 'تسوق',
                    value: 350,
                    percentage: 12,
                    color: AppColors.success,
                  ),
                  CategoryBreakdown(
                    name: 'أخرى',
                    value: 147,
                    percentage: 6,
                    color: const Color(0xFF9C27B0),
                  ),
                ],
                totalAmount: 2857,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
