import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_expense/core/constants/app_strings.dart';
import 'package:smart_expense/core/theme/app_colors.dart';
import 'package:smart_expense/core/theme/app_spacing.dart';
import 'package:smart_expense/core/theme/app_text_styles.dart';
import 'package:smart_expense/features/onboarding/data/models/onboarding_data.dart';
import 'package:smart_expense/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:smart_expense/features/onboarding/presentation/widgets/onboarding_illustration.dart';
import 'package:smart_expense/features/onboarding/presentation/widgets/onboarding_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentIndex == OnboardingData.pages.length - 1;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Skip button ──
            Padding(
              padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      context.go('/main');
                    },
                    child: const Text(AppStrings.onboardingSkip),
                  ),
                ],
              ),
            ),

            // ── PageView ──
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: OnboardingData.pages.length,
                itemBuilder: (context, index) {
                  final page = OnboardingData.pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenHorizontal,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnboardingIllustration(
                          pageNumber: page.pageNumber,
                          icon: page.icon,
                        ),
                        const SizedBox(height: AppSpacing.space8),
                        Text(
                          page.title,
                          style: AppTextStyles.title.copyWith(
                            color: AppColors.foreground,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.space4),
                        Text(
                          page.description,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.mutedForeground,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ── Indicator ──
            OnboardingIndicator(
              currentIndex: _currentIndex,
              totalPages: OnboardingData.pages.length,
            ),

            const SizedBox(height: AppSpacing.space8),

            // ── CTA button ──
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenHorizontal,
              ),

              child: OnboardingButton(
                
                text: isLastPage ? AppStrings.onboardingStart : AppStrings.onboardingNext,
                onPressed: () {
                  if (isLastPage) {
                    context.go('/main');
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),

            const SizedBox(height: AppSpacing.space8),
            const SizedBox(height: AppSpacing.space8),

            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
