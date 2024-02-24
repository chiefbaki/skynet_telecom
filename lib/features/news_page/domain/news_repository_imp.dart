import 'package:skynet/features/news_page/data/news_model.dart';
import 'package:skynet/features/news_page/data/news_repository.dart';
import 'package:skynet/features/news_page/domain/news_repository_usecase.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRepositoryImpl({required this.useCase});
  final NewsRepositoryUseCase useCase;
  @override
  Future<List<NewsModel>> getNews() {
    
    return useCase.getNews();
  }

}