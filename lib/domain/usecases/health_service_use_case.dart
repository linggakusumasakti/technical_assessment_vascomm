import 'package:technical_assessment_vascomm/domain/entities/health_service.dart';

import '../../data/repositories/repository.dart';

class HealthServiceUseCase {
  final Repository repository;

  HealthServiceUseCase({required this.repository});

  List<HealthService> getHealthService() {
    return repository.getHealthService();
  }
}
