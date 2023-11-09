import 'package:technical_assessment_vascomm/domain/entities/product.dart';

import '../../data/repositories/repository.dart';

class ProductUseCase {
  final Repository repository;

  ProductUseCase({required this.repository});

  List<Product> getProduct() {
    return repository.getProduct();
  }
}
