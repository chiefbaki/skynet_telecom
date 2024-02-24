import 'package:skynet/features/main_page/data/balance_model.dart';

abstract class ClientInfoState {}

class ClientInfoInitialState extends ClientInfoState {}

class ClientInfoLoadingState extends ClientInfoState {}

class ClientInfoSuccessState extends ClientInfoState {
  final BalanceModel model;
  ClientInfoSuccessState({required this.model});
}

class ClientInfoErrorState extends ClientInfoState {
  final String error;
  ClientInfoErrorState({required this.error});
}
