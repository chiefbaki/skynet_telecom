part of 'news_bloc.dart';

abstract class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<NewsModel> model;
  NewsSuccess({required this.model});
}

final class NewsError extends NewsState {
  final String error;
  NewsError({required this.error});
}
