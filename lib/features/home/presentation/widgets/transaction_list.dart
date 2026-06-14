import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_radius.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/features/expenses/domain/entities/transaction_entity.dart';
import 'package:smart_expense/features/home/presentation/widgets/section_header.dart';
import 'package:smart_expense/shared/widgets/transaction_row.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionEntity> transactions;
  final VoidCallback? onViewAll;

  const TransactionList({
    super.key,
    required this.transactions,
    this.onViewAll,
  });

  static Map<String, dynamic> _getCategoryStyle(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.food:
        return {
          'icon': Icons.restaurant_rounded,
          'color': const Color(0xFF9C27B0),
        };
      case TransactionCategory.transport:
        return {
          'icon': Icons.directions_car_rounded,
          'color': const Color(0xFF2196F3),
        };
      case TransactionCategory.bills:
        return {
          'icon': Icons.receipt_long_rounded,
          'color': const Color(0xFF4CAF50),
        };
      case TransactionCategory.entertainment:
        return {
          'icon': Icons.movie_rounded,
          'color': const Color(0xFFFF9800),
        };
      case TransactionCategory.shopping:
        return {
          'icon': Icons.shopping_bag_rounded,
          'color': const Color(0xFF00BCD4),
        };
      case TransactionCategory.salary:
        return {
          'icon': Icons.account_balance_wallet_rounded,
          'color': const Color(0xFF4CAF50),
        };
      case TransactionCategory.other:
        return {
          'icon': Icons.more_horiz_rounded,
          'color': const Color(0xFF607D8B),
        };
    }
  }

  static String _getCategoryName(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.food:
        return 'طعام';
      case TransactionCategory.transport:
        return 'مواصلات';
      case TransactionCategory.bills:
        return 'فواتير';
      case TransactionCategory.entertainment:
        return 'ترفيه';
      case TransactionCategory.shopping:
        return 'تسوق';
      case TransactionCategory.salary:
        return 'راتب';
      case TransactionCategory.other:
        return 'أخرى';
    }
  }

  static String _formatAmount(double amount) {
    return '${NumberFormat('#,##0.##', 'ar').format(amount)} ج.م';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Column(
        children: [
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
              children: transactions.isEmpty
                  ? [
                      const Padding(
                        padding: EdgeInsets.all(AppSpacing.space6),
                        child: Text(
                          'لا توجد معاملات',
                          style: TextStyle(color: AppColors.mutedForeground),
                        ),
                      ),
                    ]
                  : transactions.take(3).map((transaction) {
                      final style = _getCategoryStyle(transaction.category);
                      final categoryName = _getCategoryName(transaction.category);
                      final isExpense = transaction.type == TransactionType.expense;
                      final title = transaction.note.trim().isNotEmpty
                          ? transaction.note
                          : (categoryName.trim().isNotEmpty
                              ? categoryName
                              : (isExpense ? 'مصروف' : 'دخل'));
                      return Column(
                        children: [
                          TransactionRow(
                            name: title,
                            category: categoryName,
                            amount: _formatAmount(transaction.amount),
                            iconBackgroundColor: AppColors.withAlpha(
                              style['color'] as Color,
                              0.15,
                            ),
                            iconColor: style['color'] as Color,
                            icon: style['icon'] as IconData,
                            isExpense: isExpense,
                          ),
                          if (transaction != transactions.last && transaction != transactions.take(3).last)
                            const Divider(
                              color: AppColors.border45,
                              indent: AppSpacing.space5,
                              endIndent: AppSpacing.space5,
                            ),
                        ],
                      );
                    }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
