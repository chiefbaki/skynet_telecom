import 'package:dio/dio.dart';
import 'package:skynet/features/main_page/data/balance_model.dart';

class BalanceRepositoryUseCase {
  final Dio dio;

  BalanceRepositoryUseCase({required this.dio});

  Future<BalanceModel> getClientInfo() async {
    final Response response = await dio.post("/balance/", data: {
      "ls_abonent": "175050620",
    });
    return BalanceModel.fromJson(response.data);
  }
}
