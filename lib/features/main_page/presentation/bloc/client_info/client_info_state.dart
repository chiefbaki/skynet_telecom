import 'package:skynet/features/main_page/data/client_info_model.dart';

abstract class ClientInfoState {}

class ClientInfoInitialState extends ClientInfoState {}

class ClientInfoLoadingState extends ClientInfoState {}

class ClientInfoSuccessState extends ClientInfoState {
  final ClientInfoModel model;
  ClientInfoSuccessState({required this.model});
}

class ClientInfoErrorState extends ClientInfoState {
  final String error;
  ClientInfoErrorState({required this.error});
}
