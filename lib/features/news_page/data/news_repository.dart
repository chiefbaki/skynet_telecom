import 'package:skynet/features/news_page/data/news_model.dart';

abstract class NewsRepository{
  Future<List<NewsModel>> getNews();
}