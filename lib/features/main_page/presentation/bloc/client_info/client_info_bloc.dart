import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/features/main_page/data/balance_repository.dart';
import 'package:skynet/features/main_page/data/client_info_model.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_event.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_state.dart';

class ClientInfoBloc extends Bloc<ClientInfoEvent, ClientInfoState> {
  ClientInfoBloc({required this.repository}) : super(ClientInfoInitialState()) {
    on<ClientInfoEvent>((event, emit) async{
      emit(ClientInfoLoadingState());
      try {
        final ClientInfoModel model = await repository.getClientInfo();
        emit(ClientInfoSuccessState(model: model));
      } catch (e) {
        emit(ClientInfoErrorState(error: e.toString()));
      }
    });
  }
  final BalanceRepository repository;
}
