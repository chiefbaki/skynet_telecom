part of 'transactions_bloc.dart';

sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class TransactionsLoading extends TransactionsState {}

final class TransactionsSuccess extends TransactionsState {
  final TransactionsModel model;
  TransactionsSuccess({required this.model});
}

final class TransactionsError extends TransactionsState {
  final String error;
  TransactionsError({required this.error});
}
