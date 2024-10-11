import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gallery_app/models/image_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageRepository {
  final String _baseUrl = 'https://pixabay.com/api/';
  final String _apiKey = '46456188-a0c3fc8e647c5c133b9d3e798';
  final String _perPage = '25';

  Future<List<ImageModel>> fetchImages(int page) async {
    debugPrint(page.toString());
    final response = await http.get(Uri.parse('$_baseUrl?key=$_apiKey&per_page=$_perPage&page=$page'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (data['hits'] != null) {
        return (data['hits'] as List)
            .map((item) => ImageModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } else {
      if (response.body.contains('page is out of valid range')) {
        throw PaginationException('Page is out of valid range');
      } else {
        throw HttpException('Failed to fetch data: ${response.statusCode} ${response.reasonPhrase}\n${response.body}');
      }    }
  }
}

class PaginationException implements Exception {
  final String message;

  PaginationException(this.message);

  @override
  String toString() => message;
}