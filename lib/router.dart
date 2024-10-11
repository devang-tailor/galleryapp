import 'package:get/get.dart';
import 'package:gallery_app/widgets/image_grid.dart';

class AppRouter {
  static final List<GetPage> pages = [
    GetPage(name: '/', page: () => ImageGrid()),
  ];
}