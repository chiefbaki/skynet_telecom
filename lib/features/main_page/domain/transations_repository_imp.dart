import 'package:skynet/features/main_page/data/transactions_model.dart';
import 'package:skynet/features/main_page/data/transactions_repository.dart';
import 'package:skynet/features/main_page/domain/transations_repository_usecase.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsRepositoryUseCase useCase;
  TransactionsRepositoryImpl({required this.useCase});
  @override
  Future<TransactionsModel> getTransactions() {
    return useCase.getTransactions();
  }
}
