import 'package:dio/dio.dart';
import 'package:skynet/features/main_page/data/client_info_model.dart';

class BalanceRepositoryUseCase {
  final Dio dio;

  BalanceRepositoryUseCase({required this.dio});

  Future<ClientInfoModel> getClientInfo() async {
    final Response response = await dio.post("/balance/", data: {
      "ls_abonent": "175050620",
    });
    return ClientInfoModel.fromJson(response.data);
  }
}
