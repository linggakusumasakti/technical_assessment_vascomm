import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/utils/text_style_proxima.dart';
import 'package:technical_assessment_vascomm/common/widget/custom_app_bar.dart';
import 'package:technical_assessment_vascomm/presentation/home/home_controller.dart';
import 'package:technical_assessment_vascomm/presentation/home/widget/covid_section.dart';
import 'package:technical_assessment_vascomm/presentation/home/widget/item_banner.dart';
import 'package:technical_assessment_vascomm/presentation/home/widget/item_category.dart';
import 'package:technical_assessment_vascomm/presentation/home/widget/item_health_service.dart';
import 'package:technical_assessment_vascomm/presentation/home/widget/item_product.dart';
import 'package:technical_assessment_vascomm/presentation/home/widget/notification_section.dart';
import 'package:technical_assessment_vascomm/presentation/home/widget/search_filter.dart';
import 'package:technical_assessment_vascomm/presentation/home/widget/track_section.dart';
import 'package:technical_assessment_vascomm/presentation/menu/pop_up_menu.dart';

import '../../common/utils/text_style_gilroy.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GetBuilder<HomeController>(builder: (context) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: PageView.builder(
                            controller: controller.pageController,
                            onPageChanged: controller.onPageChanged,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return const ItemBanner();
                            },
                          ),
                        ),
                        Positioned(
                          right: 25,
                          bottom: 20,
                          child: DotsIndicator(
                            dotsCount: 3,
                            position: controller.currentPage.value,
                            decorator: DotsDecorator(
                              color: Colors.white,
                              spacing: const EdgeInsets.symmetric(horizontal: 4),
                              activeColor: Colors.white,
                              size: const Size(8, 8),
                              activeSize: const Size(30.0, 8),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const CovidSection(),
                    const TrackSection(),
                    const SearchFilter(),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final category = controller.category[index];
                            return ItemCategory(
                              category: category,
                              isSelected:
                                  controller.selectedCategoryIndex.value == index,
                              onTap: () {
                                controller.updateCategoryIndex(index);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                          itemCount: controller.category.length),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final product = controller.product[index];
                            return ItemProduct(
                              product: product,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 20,
                            );
                          },
                          itemCount: controller.product.length),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Pilih Tipe Layanan Kesehatan Anda',
                        style: primaryGilroyRegular16,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadow,
                            blurRadius: 20,
                            offset: const Offset(0, 20),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        child: Container(
                          height: 34,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: TabBar(
                              isScrollable: true,
                              dividerColor: Colors.transparent,
                              indicator: BoxDecoration(
                                  color: bgTabBar,
                                  borderRadius: BorderRadius.circular(30)),
                              labelStyle: primaryProxima14,
                              labelColor: primaryColor,
                              unselectedLabelStyle: greyProxima14,
                              unselectedLabelColor: grey,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: const [
                                Tab(
                                  text: "Satuan",
                                ),
                                Tab(
                                  text: "Paket Pemeriksaan",
                                )
                              ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final healthService = controller.healthService[index];
                            return ItemHealthService(
                              healthService: healthService,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 30,
                            );
                          },
                          itemCount: controller.healthService.length),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
            const NotificationSection()
          ],
        );
      }),
    );
  }
}
