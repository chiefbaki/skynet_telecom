import 'package:skynet/features/main_page/data/personal_news_model.dart';

abstract class PersonalNewsRepository {
  Future<List<PersonalNewsModel>> getPersonalNews();
}
