import 'package:flutter/material.dart';
import 'package:gallery_app/controller/image_grid_controller.dart';
import 'router.dart';
import 'services/api_service.dart';
import 'package:get/get.dart';


void main() {
  // Register the ApiService with GetX dependency injection
  Get.lazyPut<ApiService>(() => ApiService());
  Get.lazyPut(() => ImageGridController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery App',
      initialRoute: '/',
      getPages: AppRouter.pages,
    );
  }
}