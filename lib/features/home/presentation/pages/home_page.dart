import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/features/home/presentation/widgets/balance_card.dart';
import 'package:smart_expense/features/home/presentation/widgets/home_header.dart';
import 'package:smart_expense/features/home/presentation/widgets/quick_actions_row.dart';
import 'package:smart_expense/features/home/presentation/widgets/transaction_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
          child: SizedBox(height: AppSpacing.space4),
        ),
            // HomeHeader
            SliverToBoxAdapter(
              child: HomeHeader(
                userName: 'أحمد',
                date: 'يونيو ٢٠٢٦',
                initials: 'أم',
              ),
            ),
        
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // BalanceCard
            SliverToBoxAdapter(
              child: BalanceCard(
                balance: '٩,١٥٣',
                income: '١٢,٠٠٠',
                expenses: '٢,٨٥٧',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // QuickActions
            SliverToBoxAdapter(
              child: QuickActionsRow(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // TransactionList
            SliverToBoxAdapter(
              child: TransactionList(
                onViewAll: () {
                  
                },
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
