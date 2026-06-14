import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_expense/features/expenses/domain/entities/transaction_entity.dart';
import 'package:smart_expense/features/expenses/domain/repositories/transaction_repository.dart';
import 'package:smart_expense/features/profile/domain/entities/profile_stats.dart';
import 'package:smart_expense/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final TransactionRepository repository;
  final SharedPreferences _prefs;

  static const String _budgetKey = 'monthly_budget';

  ProfileCubit(this.repository, this._prefs) : super(ProfileInitial());

  Future<void> getProfileStats() async {
    emit(ProfileLoading());

    try {
      final transactions = await repository.getTransactions();
      final stats = _calculateStats(transactions);
      final budget = _loadBudget();
      final monthlySpent = _calculateMonthlySpent(transactions);

      emit(ProfileLoaded(
        stats: stats,
        budget: budget,
        monthlySpent: monthlySpent,
      ));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> silentReload() async {
    try {
      final transactions = await repository.getTransactions();
      final stats = _calculateStats(transactions);
      final budget = _loadBudget();
      final monthlySpent = _calculateMonthlySpent(transactions);

      emit(ProfileLoaded(
        stats: stats,
        budget: budget,
        monthlySpent: monthlySpent,
      ));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> setBudget(double budget) async {
    await _prefs.setDouble(_budgetKey, budget);
    await silentReload();
  }

  double _loadBudget() {
    return _prefs.getDouble(_budgetKey) ?? 0;
  }

  double _calculateMonthlySpent(List<TransactionEntity> transactions) {
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month, 1);

    return transactions
        .where((t) =>
            t.type == TransactionType.expense &&
            !t.date.isBefore(monthStart))
        .fold<double>(0, (sum, t) => sum + t.amount);
  }

  ProfileStats _calculateStats(
    List<TransactionEntity> transactions,
  ) {
    final now = DateTime.now();

    final monthStart = DateTime(
      now.year,
      now.month,
      1,
    );

    final monthlyTransactions = transactions.where(
      (transaction) =>
          transaction.date.isAfter(monthStart) ||
          transaction.date.isAtSameMomentAs(monthStart),
    );

    final monthlyIncome = monthlyTransactions
        .where((transaction) => transaction.type == TransactionType.income)
        .fold<double>(
          0,
          (sum, transaction) => sum + transaction.amount,
        );

    final monthlyExpense = monthlyTransactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .fold<double>(
          0,
          (sum, transaction) => sum + transaction.amount,
        );

    final savingsRate = monthlyIncome > 0
        ? ((monthlyIncome - monthlyExpense) / monthlyIncome) * 100
        : 0.0;

    return ProfileStats(
      totalTransactions: transactions.length,
      totalIncome: monthlyIncome,
      totalExpense: monthlyExpense,
      savingsRate: savingsRate,
    );
  }
}