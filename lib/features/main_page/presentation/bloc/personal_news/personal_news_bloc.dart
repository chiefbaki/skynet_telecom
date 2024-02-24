import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/features/main_page/data/personal_news_model.dart';
import 'package:skynet/features/main_page/data/personal_news_repository.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_event.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_state.dart';

class PersonalNewsBloc extends Bloc<PersonalNewsEvent, PersonalNewsState> {
  PersonalNewsBloc({required this.repository}) : super(PersonalNewsInitial()) {
    on<PersonalNewsEvent>((event, emit) async {
      emit(PersonalNewsLoading());
      try {
        List<PersonalNewsModel> lst = await repository.getPersonalNews();
        PersonalNewsModel model = lst.first;
        emit(PersonalNewsSuccess(model: model));
      } catch (e) {
        emit(PersonalNewsError(error: e.toString().toUpperCase()));
        
      } 
    });
  }
  final PersonalNewsRepository repository;
}
