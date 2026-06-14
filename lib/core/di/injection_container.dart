import 'package:get_it/get_it.dart';
import 'package:smart_expense/core/database/app_database.dart';
import 'package:smart_expense/features/expenses/data/datasources/local/transaction_local_datasource.dart';
import 'package:smart_expense/features/expenses/data/datasources/local/transaction_local_datasource_imp.dart';
import 'package:smart_expense/features/expenses/data/repositories/transaction_repository_imp.dart';
import 'package:smart_expense/features/expenses/domain/repositories/transaction_repository.dart';
import 'package:smart_expense/features/expenses/presentation/cubit/transaction_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Database
  sl.registerLazySingleton(() => AppDatabase());

  // DataSource
  sl.registerLazySingleton<TransactionLocalDataSource>(
    () => TransactionLocalDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(sl()),
  );

  // Cubit
  sl.registerLazySingleton(
    () => TransactionCubit(sl()),
  );
}
