import 'dart:io';

import 'package:get/get.dart';
import 'package:unasman_library/model/book_model.dart';
import 'package:unasman_library/util/const.dart';

class BookA extends GetConnect {
  // url
  final String _bookUrl = kServerUrl + '/book';

  @override
  void onInit() {
    httpClient.baseUrl = _bookUrl;
    httpClient.defaultContentType = 'application/json';
  }

  Future<Response> fetchBooks() =>
      get(_bookUrl, contentType: 'application/json');

  Future<Response> postBook(Book book, File? image) {
    final mapData = book.toMap();

    if (image != null) {
      mapData.putIfAbsent(
          'image', () => MultipartFile(image, filename: book.kode + '.jpg'));
    }
    final FormData form = FormData(mapData);
    return post(_bookUrl, form);
  }

  Future<Response> deleteBook(Book book) =>
      delete(_bookUrl, query: book.toMap(), contentType: 'application/json');
}
