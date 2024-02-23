import 'package:skynet/features/main_page/data/personal_news_model.dart';
import 'package:skynet/features/main_page/data/personal_news_repository.dart';
import 'package:skynet/features/main_page/domain/personal_repository_usecase.dart';

class PersonalNewsRepositoryImpl implements PersonalNewsRepository {
  PersonalNewsRepositoryImpl({required this.useCase});
  final PersonalNewsUseCase useCase;
  @override
  Future<List<PersonalNewsModel>> getPersonalNews() {
    return useCase.getPersonalNews();
  }
}
