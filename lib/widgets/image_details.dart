import 'package:flutter/material.dart';
import 'package:gallery_app/models/image_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery_app/ui_extentions/size_extension.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ImageDetails extends StatelessWidget {
  final ImageModel image;
  final double height;
  final double width;
  final double dialogWidth;
  String url;

  ImageDetails({required this.image,required this.height,required this.width, required this.url, required this.dialogWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.contain,
          height: height,
          width: width,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: kIsWeb ? 25 : 35,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.black.withOpacity(0.5),
            ),
            width: kIsWeb ? 192 : dialogWidth,
            child: kIsWeb
                ? Row(
                    children: [
                      Row(
                        children: [
                          5.0.spaceX,
                          const Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 12,
                          ),
                          2.0.spaceX,
                          Text(
                            'Likes: ${image.likes}',
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      10.0.spaceX,
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 12,
                          ),
                          2.0.spaceX,
                          Text(
                            'Views: ${image.views}',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      2.0.spaceY,
                      Row(
                        children: [
                          5.0.spaceX,
                          const Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 12,
                          ),
                          2.0.spaceX,
                          Text(
                            'Likes: ${image.likes}',
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      2.0.spaceY,
                      Row(
                        children: [
                          5.0.spaceX,
                          const Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 12,
                          ),
                          2.0.spaceX,
                          Text(
                            'Views: ${image.views}',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
