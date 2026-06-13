
import 'package:go_router/go_router.dart';
import 'package:smart_expense/features/expenses/presentation/pages/add_transaction_page.dart';
import 'package:smart_expense/features/main_layout/presentation/pages/main_layout_page.dart';
import 'package:smart_expense/core/constants/app_routes.dart';
import 'package:smart_expense/features/onboarding/presentation/pages/onboarding_page.dart';
final appRouter = GoRouter(
  initialLocation: AppRoutes.onboarding,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.main,
      builder: (context, state) => const MainLayoutPage(),
    ),

    GoRoute(
      path: AppRoutes.addTransaction,
      builder: (context, state) => const AddTransactionPage(),
    ),
  ],
);