import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_radius.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/amount_card.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/category_grid.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/date_selector.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/description_field.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/save_transaction_button.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/suggestion_chip.dart';
import 'package:smart_expense/features/expenses/presentation/widgets/transaction_type_selector.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  bool _isExpense = true;
  String _amount = '٨٦';
  String _description = 'مطعم كنتاكي';
  String? _selectedCategory = 'طعام';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                  vertical: AppSpacing.space4,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Container(
                        padding: const EdgeInsets.all(AppSpacing.space2),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          color: AppColors.foreground,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.space3),
                    Expanded(
                      child: Text(
                        'إضافة معاملة',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headline.copyWith(
                          color: AppColors.foreground,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Balance for close button
                  ],
                ),
              ),
            ),
            // Transaction Type Selector
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: TransactionTypeSelector(
                  isExpense: _isExpense,
                  onChanged: (isExpense) {
                    setState(() {
                      _isExpense = isExpense;
                    });
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Amount Card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: AmountCard(amount: _amount),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Description Field
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: DescriptionField(
                  hintText: 'أدخل وصف المعاملة',
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space4),
            ),
            // Suggestion Chip
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: SuggestionChip(
                  label: 'اقتراح: طعام - مواصلات - فواتير',
                  onApply: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Category Grid
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: CategoryGrid(
                  selectedCategory: _selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Date Selector
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: DateSelector(
                  dateLabel: 'اليوم، ٨ يونيو ٢٠٢٦',
                  onTap: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space8),
            ),
            // Save Button
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: SaveTransactionButton(
                  onPressed: () {},
                ),
              ),
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
