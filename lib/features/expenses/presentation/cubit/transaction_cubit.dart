import 'package:bloc/bloc.dart';
import 'package:smart_expense/features/expenses/domain/entities/transaction_entity.dart';
import 'package:smart_expense/features/expenses/domain/repositories/transaction_repository.dart';
import 'package:smart_expense/features/expenses/presentation/cubit/transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepository repository;

  TransactionCubit(this.repository) : super(TransactionInitial());

  Future<void> addTransaction(TransactionEntity transaction) async {
    emit(TransactionLoading());
    try {
      await repository.addTransaction(transaction);
      await _refreshTransactions();
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> getTransactions() async {
    emit(TransactionLoading());
    try {
      final transactions = await repository.getTransactions();
      emit(TransactionLoaded(transactions));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> deleteTransaction(int id) async {
    emit(TransactionLoading());
    try {
      await repository.deleteTransaction(id);
      await _refreshTransactions();
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> updateTransaction(TransactionEntity transaction) async {
    emit(TransactionLoading());
    try {
      await repository.updateTransaction(transaction);
      await _refreshTransactions();
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> _refreshTransactions() async {
    try {
      final transactions = await repository.getTransactions();
      emit(TransactionLoaded(transactions));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }
}
