
import 'package:go_router/go_router.dart';
import 'package:smart_expense/features/expenses/presentation/pages/add_expense_page.dart';
import 'package:smart_expense/features/main_layout/presentation/pages/main_layout_page.dart';
import 'package:smart_expense/core/constants/app_routes.dart';
final appRouter = GoRouter(
  initialLocation: AppRoutes.main,
  routes: [
    GoRoute(
      path: AppRoutes.main,
      builder: (context, state) => const MainLayoutPage(),
    ),

    GoRoute(
      path: AppRoutes.addTransaction,
      builder: (context, state) => const AddExpensePage(),
    ),
  ],
);