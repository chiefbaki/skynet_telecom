import 'package:skynet/features/main_page/data/personal_news_model.dart';

abstract class PersonalNewsState {}

class PersonalNewsInitial extends PersonalNewsState {}

class PersonalNewsLoading extends PersonalNewsState {}

class PersonalNewsSuccess extends PersonalNewsState {
  final PersonalNewsModel model;
  PersonalNewsSuccess({required this.model});
}

class PersonalNewsError extends PersonalNewsState {
  final String error;
  PersonalNewsError({required this.error});
}
