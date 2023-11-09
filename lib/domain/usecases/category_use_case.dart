import 'package:technical_assessment_vascomm/data/repositories/repository.dart';

class CategoryUseCase {
  final Repository repository;

  CategoryUseCase({required this.repository});

  List<String> getCategory() {
    return repository.getCategory();
  }
}
