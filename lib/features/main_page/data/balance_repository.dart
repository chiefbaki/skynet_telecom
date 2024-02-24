import 'package:skynet/features/main_page/data/balance_model.dart';

abstract class BalanceRepository{
  Future<BalanceModel> getClientInfo();
}