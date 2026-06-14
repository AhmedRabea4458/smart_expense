import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_radius.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/expenses/domain/entities/transaction_entity.dart';
import 'package:smart_expense/features/expenses/presentation/cubit/transaction_cubit.dart';
import 'package:smart_expense/features/expenses/presentation/cubit/transaction_state.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/transaction_card.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/transaction_group_header.dart';
import 'package:smart_expense/shared/widgets/filter_chip_widget.dart';
import 'package:smart_expense/shared/widgets/search_bar.dart' hide SearchBar;

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // AppBar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                  vertical: AppSpacing.space4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tune_rounded,
                        color: AppColors.foreground,
                      ),
                    ),
                    Text(
                      'المعاملات',
                      style: AppTextStyles.headline.copyWith(
                        color: AppColors.foreground,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.foreground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: SearchBar(
                  hintText: 'البحث في المعاملات...',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space4),
            ),
            // Filter Chips
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: Row(
                  children: [
                    FilterChipWidget(
                      label: 'الكل',
                      isActive: true,
                    ),
                    SizedBox(width: AppSpacing.space2),
                    FilterChipWidget(
                      label: 'طعام',
                    ),
                    SizedBox(width: AppSpacing.space2),
                    FilterChipWidget(
                      label: 'مواصلات',
                    ),
                    SizedBox(width: AppSpacing.space2),
                    FilterChipWidget(
                      label: 'فواتير',
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space4),
            ),
            // BlocBuilder for transactions
            BlocBuilder<TransactionCubit, TransactionState>(
              builder: (context, state) {
                if (state is TransactionLoading) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.space8),
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  );
                } else if (state is TransactionError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.space8),
                        child: Text(
                          'حدث خطأ: ${state.message}',
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.destructive,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is TransactionLoaded) {
                  if (state.transactions.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.space8),
                          child: Text(
                            'لا توجد معاملات',
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.mutedForeground,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return _TransactionsList(transactions: state.transactions);
                }
                return const SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                );
              },
            ),
            // Bottom padding
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space8),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionsList extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const _TransactionsList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final transaction = transactions[index];
          final categoryInfo = _getCategoryInfo(transaction.category);
          
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenHorizontal,
              vertical: AppSpacing.space1,
            ),
            child: Dismissible(
              key: Key('transaction_${transaction.id}'),
              direction: DismissDirection.endToStart,
              background: Container(
                decoration: BoxDecoration(
                  color: AppColors.destructive,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: AppSpacing.space5),
                child: const Icon(
                  Icons.delete_rounded,
                  color: Colors.white,
                ),
              ),
              onDismissed: (_) {
                context.read<TransactionCubit>().deleteTransaction(transaction.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('تم حذف المعاملة'),
                    backgroundColor: AppColors.destructive,
                    action: SnackBarAction(
                      label: 'تراجع',
                      textColor: Colors.white,
                      onPressed: () {
                        // TODO: Implement undo functionality
                      },
                    ),
                  ),
                );
              },
              child: TransactionCard(
                name: transaction.note,
                category: categoryInfo.label,
                amount: '${transaction.amount.toStringAsFixed(0)} ج.م',
                iconBackgroundColor: AppColors.withAlpha(
                  categoryInfo.color,
                  0.15,
                ),
                iconColor: categoryInfo.color,
                icon: categoryInfo.icon,
                isExpense: transaction.type == TransactionType.expense,
                onTap: () {},
              ),
            ),
          );
        },
        childCount: transactions.length,
      ),
    );
  }

  _CategoryInfo _getCategoryInfo(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.food:
        return _CategoryInfo(
          label: 'طعام',
          icon: Icons.restaurant_rounded,
          color: AppColors.primary,
        );
      case TransactionCategory.transport:
        return _CategoryInfo(
          label: 'مواصلات',
          icon: Icons.directions_car_rounded,
          color: const Color(0xFF2196F3),
        );
      case TransactionCategory.bills:
        return _CategoryInfo(
          label: 'فواتير',
          icon: Icons.receipt_long_rounded,
          color: AppColors.success,
        );
      case TransactionCategory.entertainment:
        return _CategoryInfo(
          label: 'ترفيه',
          icon: Icons.movie_rounded,
          color: AppColors.warning,
        );
      case TransactionCategory.shopping:
        return _CategoryInfo(
          label: 'تسوق',
          icon: Icons.shopping_bag_rounded,
          color: const Color(0xFF00BCD4),
        );
      case TransactionCategory.salary:
        return _CategoryInfo(
          label: 'راتب',
          icon: Icons.attach_money_rounded,
          color: AppColors.success,
        );
      case TransactionCategory.other:
        return _CategoryInfo(
          label: 'أخرى',
          icon: Icons.more_horiz_rounded,
          color: AppColors.mutedForeground,
        );
    }
  }
}

class _CategoryInfo {
  final String label;
  final IconData icon;
  final Color color;

  _CategoryInfo({
    required this.label,
    required this.icon,
    required this.color,
  });
}
