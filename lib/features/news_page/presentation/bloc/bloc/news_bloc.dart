import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skynet/features/news_page/data/news_model.dart';
import 'package:skynet/features/news_page/data/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.repository}) : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async{
      emit(NewsLoading());
      try {
        List<NewsModel> model = await repository.getNews();
        emit(NewsSuccess(model: model));
      } catch (e) {
        emit(NewsError(error: e.toString()));
      }
    });
  }
  final NewsRepository repository;
}
