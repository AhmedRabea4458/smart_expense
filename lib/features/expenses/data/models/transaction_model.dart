import 'package:smart_expense/features/expenses/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.id,
    required super.note,
    required super.amount,
    required super.date,
    required super.category,
    required super.type,
  });
}