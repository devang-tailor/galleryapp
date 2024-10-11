import 'package:get/get.dart';
import 'package:gallery_app/repositories/image_repository.dart';
import 'package:gallery_app/models/image_model.dart';

class ApiService extends GetxService {
  final ImageRepository _repository = ImageRepository();

  Future<List<ImageModel>> fetchImages(int page) async {
    return _repository.fetchImages(page);
  }
}