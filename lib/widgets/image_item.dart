import 'package:flutter/material.dart';
import 'package:gallery_app/models/image_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery_app/ui_extentions/size_extension.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:gallery_app/widgets/image_details.dart';

class ImageItem extends StatelessWidget {
  final ImageModel image;

  ImageItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showImageDialog(context, image);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ImageDetails(
          image: image,
          height: 200,
          width: double.infinity,
          url: image.previewURL,
          dialogWidth: 130,
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, ImageModel image) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ImageDetails(
              dialogWidth: MediaQuery.of(context).size.width * 0.8,
              image: image,
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              url: image.largeImageURL,
            ),
          ),
        );
      },
    );
  }
}
