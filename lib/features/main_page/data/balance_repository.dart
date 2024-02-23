import 'package:skynet/features/main_page/data/client_info_model.dart';

abstract class BalanceRepository{
  Future<ClientInfoModel> getClientInfo();
}