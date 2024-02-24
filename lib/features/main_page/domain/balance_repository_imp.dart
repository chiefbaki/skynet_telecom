import 'package:skynet/features/main_page/data/balance_repository.dart';
import 'package:skynet/features/main_page/data/balance_model.dart';
import 'package:skynet/features/main_page/domain/balance_repository_usecase.dart';

class BalanceRepositoryImpl implements BalanceRepository{
  final BalanceRepositoryUseCase balanceRepUseCase;
  BalanceRepositoryImpl({required this.balanceRepUseCase});
  @override
  Future<BalanceModel> getClientInfo() {
    
    return balanceRepUseCase.getClientInfo();
  }
}