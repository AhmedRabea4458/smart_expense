import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_radius.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/category_item.dart';

/// Grid of category items for transaction selection.
class CategoryGrid extends StatelessWidget {
  final String? selectedCategory;
  final ValueChanged<String>? onCategorySelected;

  const CategoryGrid({
    super.key,
    this.selectedCategory,
    this.onCategorySelected,
  });

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'طعام', 'icon': Icons.restaurant_rounded, 'color': Color(0xFF9C27B0)},
    {'name': 'مواصلات', 'icon': Icons.directions_car_rounded, 'color': Color(0xFF2196F3)},
    {'name': 'فواتير', 'icon': Icons.receipt_long_rounded, 'color': Color(0xFF4CAF50)},
    {'name': 'ترفيه', 'icon': Icons.movie_rounded, 'color': Color(0xFFFF9800)},
    {'name': 'صحة', 'icon': Icons.favorite_rounded, 'color': Color(0xFFF44336)},
    {'name': 'تسوق', 'icon': Icons.shopping_bag_rounded, 'color': Color(0xFF00BCD4)},
    {'name': 'أخرى', 'icon': Icons.more_horiz_rounded, 'color': Color(0xFF607D8B)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الفئة',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.mutedForeground,
          ),
        ),
        const SizedBox(height: AppSpacing.space4),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.2,
          ),
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            return CategoryItem(
              icon: category['icon'] as IconData,
              label: category['name'] as String,
              color: category['color'] as Color,
              isSelected: selectedCategory == category['name'],
              onTap: () => onCategorySelected?.call(category['name'] as String),
            );
          },
        ),
      ],
    );
  }
}
