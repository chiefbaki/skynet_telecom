import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/features/main_page/data/transactions_model.dart';
import 'package:skynet/features/main_page/data/transactions_repository.dart';
import 'package:skynet/features/main_page/presentation/bloc/transactions/bloc/transactions_event.dart';

part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc({required this.repository}) : super(TransactionsInitial()) {
    on<GetTransactionsEvent>((event, emit) async {
      emit(TransactionsLoading());
      try {
        final TransactionsModel model = await repository.getTransactions();
        emit(TransactionsSuccess(model: model));
      } catch (e) {
        emit(TransactionsError(error: e.toString()));
      }
    });
  }
  final TransactionsRepository repository;
}
