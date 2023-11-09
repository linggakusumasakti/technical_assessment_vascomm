import 'package:technical_assessment_vascomm/data/datasources/remote_data_source.dart';

import '../../domain/entities/health_service.dart';
import '../../domain/entities/product.dart';
import '../datasources/local_data_source.dart';

abstract class Repository {
  Future<Map<String, dynamic>> login(String email, String password);

  List<String> getCategory();

  List<Product> getProduct();

  List<HealthService> getHealthService();
}

class RepositoryImpl extends Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final result = await remoteDataSource.login(email, password);
    return result;
  }

  @override
  List<String> getCategory() {
    return localDataSource.getCategory();
  }

  @override
  List<Product> getProduct() {
    return localDataSource.getProduct();
  }

  @override
  List<HealthService> getHealthService() {
    return localDataSource.getHealthService();
  }
}
