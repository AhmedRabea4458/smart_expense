// In analytics/data/models/chart_data.dart
import 'dart:ui';

class ChartDataPoint {
  final int monthIndex; // 0 = Jan, 1 = Feb
  final double value;
  final String label; // Arabic month name

  const ChartDataPoint({
    required this.monthIndex,
    required this.value,
    required this.label,
  });
}

class CategoryBreakdown {
  final String name;
  final double value;
  final Color color;
  final double percentage;

  const CategoryBreakdown({
    required this.name,
    required this.value,
    required this.color,
    required this.percentage,
  });
}