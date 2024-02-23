import 'package:dio/dio.dart';
import 'package:skynet/features/main_page/data/personal_news_model.dart';

class PersonalNewsUseCase {
  final Dio dio;
  PersonalNewsUseCase({required this.dio});
  Future<List<PersonalNewsModel>> getPersonalNews() async {
    final Response response = await dio.get("/news/api/sin-post/list?",
        queryParameters: {"ls_abonent": "175050620"});
    
    final List<dynamic> responseData = response.data;
    final List<PersonalNewsModel> data = responseData.map((e) => PersonalNewsModel.fromJson(e)).toList();
    print(data.runtimeType);
    return data;

  }}
  


