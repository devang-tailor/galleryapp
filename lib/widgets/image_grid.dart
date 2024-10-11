import 'package:flutter/material.dart';
import 'package:gallery_app/controller/image_grid_controller.dart';
import 'package:gallery_app/widgets/image_item.dart';
import 'package:get/get.dart';

class ImageGrid extends GetView<ImageGridController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification) {
            if (controller.images.isNotEmpty &&
                notification.metrics.pixels >=
                    notification.metrics.maxScrollExtent * 0.8) {
              controller.nextPage();
            }
          }
          return true;
        },
        child: Obx(
              () => GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
            ),
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              return ImageItem(image: controller.images[index]);
            },
          ),
        ),
      ),
    );
  }
}