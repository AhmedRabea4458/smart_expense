import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_radius.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/home/presentation/widgets/section_header.dart';
import 'package:smart_expense/shared/widgets/transaction_row.dart';

class TransactionList extends StatelessWidget {
  final VoidCallback? onViewAll;

  const TransactionList({
    super.key,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Column(
        children: [
          // Section header
         SectionHeader(
            title: 'المعاملات الأخيرة',
            actionLabel: 'عرض الكل',
            onTap: onViewAll,
          ),
          const SizedBox(height: AppSpacing.space4),
          // Transaction card container
          Container(
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(
                color: AppColors.border45,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                TransactionRow(
                  name: 'مطعم كنتاكي',
                  category: 'مطاعم',
                  amount: '٥٨٠ ج.م',
                  iconBackgroundColor: AppColors.withAlpha(
                    AppColors.destructive,
                    0.15,
                  ),
                  iconColor: AppColors.destructive,
                  icon: Icons.restaurant_rounded,
                  isExpense: true,
                ),
                const Divider(
                  color: AppColors.border45,
                  indent: AppSpacing.space5,
                  endIndent: AppSpacing.space5,
                ),
                TransactionRow(
                  name: 'كافلور',
                  category: 'بقالة',
                  amount: '٣٤٠ ج.م',
                  iconBackgroundColor: AppColors.withAlpha(
                    AppColors.primary,
                    0.15,
                  ),
                  iconColor: AppColors.primary,
                  icon: Icons.local_grocery_store_rounded,
                  isExpense: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
