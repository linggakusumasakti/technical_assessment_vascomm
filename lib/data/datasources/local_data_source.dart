import '../../domain/entities/health_service.dart';
import '../../domain/entities/product.dart';

abstract class LocalDataSource {
  List<String> getCategory();

  List<Product> getProduct();

  List<HealthService> getHealthService();
}

class LocalDataSourceImpl extends LocalDataSource {
  @override
  List<String> getCategory() {
    return ['All Product', 'Layanan Kesehatan', 'Alat Kesehatan'];
  }

  @override
  List<Product> getProduct() {
    List<Product> products = [];
    for (int i = 0; i < 3; i++) {
      products.add(Product(
          name: 'Suntik Steril ${i + 1}',
          price: 10000,
          rating: i + 3,
          image: "assets/images/image_login.png",
          isReady: true));
    }
    return products;
  }

  @override
  List<HealthService> getHealthService() {
    return [
      HealthService(
        name: 'PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja',
        price: 1400000,
        hospital: 'Lenmarc Surabaya',
        location: 'Dukuh Pakis, Surabaya',
        image: "assets/images/image_hs_1.png",
      ),
      HealthService(
        name: 'PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja',
        price: 1400000,
        hospital: 'Lenmarc Surabaya',
        location: 'Dukuh Pakis, Surabaya',
        image: "assets/images/image_hs_2.png",
      )
    ];
  }
}
