import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/domain/entities/health_service.dart';
import 'package:technical_assessment_vascomm/domain/entities/product.dart';
import 'package:technical_assessment_vascomm/domain/usecases/category_use_case.dart';
import 'package:technical_assessment_vascomm/domain/usecases/health_service_use_case.dart';
import 'package:technical_assessment_vascomm/domain/usecases/product_use_case.dart';

class HomeController extends GetxController {
  HomeController(
      {required this.categoryUseCase,
      required this.productUseCase,
      required this.healthServiceUseCase});

  final CategoryUseCase categoryUseCase;
  final ProductUseCase productUseCase;
  final HealthServiceUseCase healthServiceUseCase;
  final PageController pageController = PageController();
  RxDouble currentPage = 0.0.obs;
  RxList<String> category = RxList();
  RxList<Product> product = RxList();
  RxList<HealthService> healthService = RxList();
  RxInt selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = (pageController.page ?? 0.0 + 1.0);
      update();
    });
    getCategory();
    getProduct();
    getHealthService();
  }

  void getCategory() {
    final data = categoryUseCase.getCategory();
    category.value = data;
    update();
  }

  void getProduct() {
    final data = productUseCase.getProduct();
    product.value = data;
    update();
  }

  void getHealthService() {
    final data = healthServiceUseCase.getHealthService();
    healthService.value = data;
    update();
  }

  void updateCategoryIndex(int value) {
    selectedCategoryIndex.value = value;
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    pageController.jumpToPage(index);
  }
}
