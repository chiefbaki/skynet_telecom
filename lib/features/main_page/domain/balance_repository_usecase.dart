import 'package:dio/dio.dart';
import 'package:skynet/core/utils/constants/api_consts.dart';
import 'package:skynet/features/main_page/data/client_info_model.dart';

class BalanceRepositoryUseCase {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiConsts.apiUrl,
    contentType: "application/json",
    headers: {
      "Authorization": "Token ${ApiConsts.apiToken}",
      "Accept": "application/json",
    },
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  ));

  Future<ClientInfoModel> getClientInfo() async {
    final Response response = await dio.post("/balance/", data: {
      "ls_abonent": "175050620",
    });
    return ClientInfoModel.fromJson(response.data);
  }
}
