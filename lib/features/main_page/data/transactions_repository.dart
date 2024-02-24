import 'package:skynet/features/main_page/data/transactions_model.dart';

abstract class TransactionsRepository{
  Future<TransactionsModel> getTransactions();
}