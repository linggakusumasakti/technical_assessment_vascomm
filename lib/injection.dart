import 'package:get_it/get_it.dart';
import 'package:technical_assessment_vascomm/data/datasources/local_data_source.dart';
import 'package:technical_assessment_vascomm/data/datasources/remote_data_source.dart';
import 'package:technical_assessment_vascomm/data/repositories/repository.dart';
import 'package:technical_assessment_vascomm/domain/usecases/category_use_case.dart';
import 'package:technical_assessment_vascomm/domain/usecases/health_service_use_case.dart';
import 'package:technical_assessment_vascomm/domain/usecases/login_use_case.dart';
import 'package:technical_assessment_vascomm/domain/usecases/product_use_case.dart';
import 'package:technical_assessment_vascomm/presentation/home/home_controller.dart';
import 'package:technical_assessment_vascomm/presentation/login/login_controller.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => LoginController(loginUseCase: locator()),
  );

  locator.registerFactory(
    () => HomeController(
        categoryUseCase: locator(),
        productUseCase: locator(),
        healthServiceUseCase: locator()),
  );

  //usecase
  locator.registerLazySingleton(() => LoginUseCase(repository: locator()));
  locator.registerLazySingleton(() => CategoryUseCase(repository: locator()));
  locator.registerLazySingleton(() => ProductUseCase(repository: locator()));
  locator
      .registerLazySingleton(() => HealthServiceUseCase(repository: locator()));

  //repository
  locator.registerLazySingleton<Repository>(
    () =>
        RepositoryImpl(remoteDataSource: locator(), localDataSource: locator()),
  );

  // data sources
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
