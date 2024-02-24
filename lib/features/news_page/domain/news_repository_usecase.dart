import 'package:dio/dio.dart';
import 'package:skynet/features/news_page/data/news_model.dart';

class NewsRepositoryUseCase{
  final Dio dio;
  NewsRepositoryUseCase({required this.dio});
  Future<List<NewsModel>> getNews() async{
    final Response response = await dio.get("/news/api/gen-post/list/");
    List<dynamic> responseData = response.data;
    List<NewsModel> model = responseData.map((e) => NewsModel.fromJson(e)).toList();
    return model;
  }
}