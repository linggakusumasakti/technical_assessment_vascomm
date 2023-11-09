import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_assessment_vascomm/presentation/get_bindings.dart';
import 'package:technical_assessment_vascomm/presentation/home/home_page.dart';
import 'package:technical_assessment_vascomm/presentation/login/login_page.dart';
import 'package:technical_assessment_vascomm/injection.dart' as di;

import 'data/utils/my_pref.dart';

void main() async {
  di.init();
  await GetStorage.init();
  GetBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var accessToken = Get.find<MyPref>().accessToken.val;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Technical Assessment Vascomm',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      initialBinding: GetBindings(),
      home: accessToken.isNotEmpty ? HomePage() : LoginPage(),
    );
  }
}
