import 'package:flutter/material.dart' hide SearchBar;
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/transaction_card.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/transaction_group_header.dart';
import 'package:smart_expense/shared/widgets/filter_chip_widget.dart';
import 'package:smart_expense/shared/widgets/search_bar.dart';

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
            // Today Group
            SliverToBoxAdapter(
              child: TransactionGroupHeader(
                label: 'اليوم',
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: TransactionCard(
                  name: 'مطعم كنتاكي',
                  category: 'طعام',
                  amount: '٨٥٠ ج.م',
                  iconBackgroundColor: AppColors.withAlpha(
                    AppColors.primary,
                    0.15,
                  ),
                  iconColor: AppColors.primary,
                  icon: Icons.restaurant_rounded,
                  isExpense: true,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space2),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: TransactionCard(
                  name: 'Vodafone',
                  category: 'فواتير',
                  amount: '١٤٩ ج.م',
                  iconBackgroundColor: AppColors.withAlpha(
                    AppColors.destructive,
                    0.15,
                  ),
                  iconColor: AppColors.destructive,
                  icon: Icons.phone_android_rounded,
                  isExpense: true,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space4),
            ),
            // Yesterday Group
            SliverToBoxAdapter(
              child: TransactionGroupHeader(
                label: 'أمس',
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: TransactionCard(
                  name: 'كارفور',
                  category: 'بقالة',
                  amount: '٣٤٠ ج.م',
                  iconBackgroundColor: AppColors.withAlpha(
                    AppColors.success,
                    0.15,
                  ),
                  iconColor: AppColors.success,
                  icon: Icons.local_grocery_store_rounded,
                  isExpense: true,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space8),
            ),
          ],
        ),
      ),
    );
  }
}
