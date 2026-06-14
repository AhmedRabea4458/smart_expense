import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';

class CategoryColors {
  static Color getColor(String category) {
    switch (category) {
      case 'طعام':
      case 'food':
        return AppColors.primary;

      case 'مواصلات':
      case 'transport':
        return const Color(0xFF2196F3);

      case 'فواتير':
      case 'bills':
        return AppColors.warning;

      case 'تسوق':
      case 'shopping':
        return AppColors.success;

      case 'ترفيه':
      case 'entertainment':
        return const Color(0xFFFF9800);

      case 'راتب':
      case 'salary':
        return const Color(0xFF4CAF50);

      case 'أخرى':
      case 'other':
        return const Color(0xFF9C27B0);

      default:
        return Colors.grey;
    }
  }

  static String getLabel(String category) {
    switch (category) {
      case 'food':
        return 'طعام';
      case 'transport':
        return 'مواصلات';
      case 'bills':
        return 'فواتير';
      case 'entertainment':
        return 'ترفيه';
      case 'shopping':
        return 'تسوق';
      case 'salary':
        return 'راتب';
      case 'other':
        return 'أخرى';
      default:
        return category;
    }
  }
}