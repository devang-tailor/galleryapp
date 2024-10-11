import 'package:gallery_app/models/image_model.dart';
import 'package:gallery_app/services/api_service.dart';
import 'package:get/get.dart';


class ImageGridController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final RxInt currentPage = 1.obs;
  final RxList<ImageModel> images = <ImageModel>[].obs;
  bool _loadingMoreData = false;


  @override
  void onInit() {
    super.onInit();
    _fetchImages();
  }

  void nextPage() {
    if (!_loadingMoreData) {
      _loadingMoreData = true;
      _fetchImages().then((_) {
        _loadingMoreData = false;
      });
    }
  }

  Future<void> _fetchImages() async {
    final images = await _apiService.fetchImages(currentPage.value);
    this.images.addAll(images);
    currentPage.value++;
  }
}