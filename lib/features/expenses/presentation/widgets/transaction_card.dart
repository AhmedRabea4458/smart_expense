import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_radius.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/shared/widgets/transaction_row.dart';

class TransactionCard extends StatelessWidget {
  final String name;
  final String category;
  final String amount;
  final Color iconBackgroundColor;
  final Color iconColor;
  final IconData icon;
  final bool isExpense;
  final VoidCallback? onTap;

  const TransactionCard({
    super.key,
    required this.name,
    required this.category,
    required this.amount,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.icon,
    this.isExpense = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: AppColors.border50,
          width: 1,
        ),
      ),
      child: TransactionRow(
        name: name,
        category: category,
        amount: amount,
        iconBackgroundColor: iconBackgroundColor,
        iconColor: iconColor,
        icon: icon,
        isExpense: isExpense,
        onTap: onTap,
      ),
    );
  }
}
