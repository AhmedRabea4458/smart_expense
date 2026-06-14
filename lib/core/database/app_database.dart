import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_expense/features/expenses/data/models/transaction_model.dart';

import 'tables/transactions_table.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/smart_expense.db');

    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    TransactionsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<TransactionsTableData>> getTransactions() {
    return select(transactionsTable).get();
  }

  Future<void> addTransaction(TransactionModel model) async {
    await into(transactionsTable).insert(
      TransactionsTableCompanion.insert(
        note: model.note,
        amount: model.amount,
        date: model.date,
        category: model.category.name,
        type: model.type.name,
      ),
    );
  }

  Future<void> deleteTransaction(int id) async {
    await (delete(transactionsTable)..where((t) => t.id.equals(id))).go();
  }

  Future<void> updateTransaction(TransactionModel model) async {
    await update(transactionsTable).replace(
      TransactionsTableCompanion(
        id: Value(model.id),
        note: Value(model.note),
        amount: Value(model.amount),
        date: Value(model.date),
        category: Value(model.category.name),
        type: Value(model.type.name),
      ),
    );
  }

  Future<void> clearTransactions() async {
    await delete(transactionsTable).go();
  }
}
