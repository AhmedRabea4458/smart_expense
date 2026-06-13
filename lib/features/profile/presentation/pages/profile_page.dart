import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_radius.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/home/presentation/widgets/section_header.dart';
import 'package:smart_expense/features/profile/presentation/widgets/budget_progress_section.dart';
import 'package:smart_expense/features/profile/presentation/widgets/profile_card.dart';
import 'package:smart_expense/shared/widgets/action_row.dart';
import 'package:smart_expense/shared/widgets/dropdown_row.dart';
import 'package:smart_expense/shared/widgets/stats_row.dart';
import 'package:smart_expense/shared/widgets/toggle_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top spacing
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Page header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'حسابي',
                      style: AppTextStyles.display.copyWith(
                        color: AppColors.foreground,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'تعديل',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Profile Card
            SliverToBoxAdapter(
              child: ProfileCard(
                name: 'مستخدم التطبيق',
                initials: 'أم',
                stats: const [
                  StatItem(label: 'معاملة', value: '٢٤٧'),
                  StatItem(label: 'هذا الشهر', value: '٢,٨٤٧'),
                  StatItem(label: 'معدل إدخار', value: '١٨٪'),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Budget Progress
            SliverToBoxAdapter(
              child: BudgetProgressSection(
                budgetLabel: 'الميزانية الشهرية',
                spentLabel: 'المنفق من الميزانية',
                budgetAmount: '٣,٥٠٠ ج.م',
                spentAmount: '٢,٨٤٧ ج.م',
                progress: 0.81,
                daysLeft: '٩ أيام متبقية',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Preferences Section
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'التفضيلات',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space4),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space5,
                  vertical: AppSpacing.space3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(
                    color: AppColors.border50,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    DropdownRow(
                      icon: Icons.attach_money_rounded,
                      iconBackgroundColor: AppColors.primary10,
                      iconColor: AppColors.primary,
                      label: 'العملة',
                      value: 'جنيه مصري (ج.م)',
                      onTap: () {},
                    ),
                    Divider(
                      color: AppColors.border45,
                      indent: AppSpacing.space5,
                      endIndent: AppSpacing.space5,
                    ),
                    ToggleRow(
                      icon: Icons.dark_mode_rounded,
                      iconBackgroundColor: AppColors.primary10,
                      iconColor: AppColors.primary,
                      label: 'الوضع الداكن',
                      initialValue: true,
                      onChanged: (value) {},
                    ),
                    Divider(
                      color: AppColors.border45,
                      indent: AppSpacing.space5,
                      endIndent: AppSpacing.space5,
                    ),
                    ToggleRow(
                      icon: Icons.notifications_none_rounded,
                      iconBackgroundColor: AppColors.primary10,
                      iconColor: AppColors.primary,
                      label: 'الإشعارات',
                      initialValue: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space6),
            ),
            // Data Section
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'الحساب والبيانات',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.space4),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space5,
                  vertical: AppSpacing.space3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(
                    color: AppColors.border50,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    ActionRow(
                      icon: Icons.download_rounded,
                      iconBackgroundColor: AppColors.primary10,
                      iconColor: AppColors.primary,
                      label: 'تصدير البيانات CSV',
                      onTap: () {},
                    ),
                    Divider(
                      color: AppColors.border45,
                      indent: AppSpacing.space5,
                      endIndent: AppSpacing.space5,
                    ),
                    ActionRow(
                      icon: Icons.info_outline_rounded,
                      iconBackgroundColor: AppColors.primary10,
                      iconColor: AppColors.primary,
                      label: 'عن التطبيق',
                      onTap: () {},
                    ),
                  ],
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
