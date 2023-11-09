import 'package:technical_assessment_vascomm/data/repositories/repository.dart';

class LoginUseCase {
  final Repository repository;

  LoginUseCase({required this.repository});

  Future<Map<String, dynamic>> execute(String email, String password) {
    return repository.login(email, password);
  }
}
