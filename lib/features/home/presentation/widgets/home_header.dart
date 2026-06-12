import 'package:flutter/material.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String date;
  final String initials;

  const HomeHeader({
    super.key,
    required this.userName,
    required this.date,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Greeting + date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('👋'),
                  const SizedBox(width: AppSpacing.space2),
                  Text(
                    'مرحباً، $userName',
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space1),
              Text(
                date,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.mutedForeground,
                ),
              ),
            ],
          ),
          // Avatar
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.primaryForeground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
