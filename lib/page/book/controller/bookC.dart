import 'dart:convert';

import 'package:get/get.dart';
import 'package:unasman_library/model/book_model.dart';
import 'package:unasman_library/page/book/api/bookA.dart';

class BookC extends GetxController {
  /// vars
  var $listBook = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();

    BookA().fetchBooks().then((value) {
      String body = value.body;
      List jsonData = jsonDecode(body);
      List<Book> listBook = [];

      jsonData.forEach((j) {
        print(j);
      });

      $listBook.assignAll(listBook);
    }).catchError((onError) {
      Get.snackbar(
        'ERROR',
        'Koneksi server bermasalah',
      );
      print(onError);
    });
  }
}
