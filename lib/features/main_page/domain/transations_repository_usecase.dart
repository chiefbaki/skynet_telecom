import 'package:dio/dio.dart';
import 'package:skynet/features/main_page/data/transactions_model.dart';

class TransactionsRepositoryUseCase {
  final Dio dio;
  TransactionsRepositoryUseCase({required this.dio});
  Future<TransactionsModel> getTransactions() async {
    final Response response =
        await dio.post("/transactions/", data: {"ls_abonent": "175050620"});
    
    return TransactionsModel.fromJson(response.data);
  }
}
