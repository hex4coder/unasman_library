import 'dart:convert';

import 'package:get/get.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';
import 'package:unasman_library/model/book_model.dart';
import 'package:unasman_library/page/book/api/bookA.dart';
import 'package:unasman_library/services/info_service.dart';

class BookC extends GetxController {
  /// vars
  var $listBook = <Book>[].obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  Future<void> fetchBooks() async {
    final lc = Get.find<LoadingController>();

    try {
      lc.showLoading('Memuat data buku...');
      final response = await BookA().fetchBooks();
      if (response.isOk) {
        String body = response.body;
        List jsonData = jsonDecode(body);
        List<Book> listBook = [];

        jsonData.forEach((j) {
          final book = Book.fromMap(j);
          listBook.add(book);
        });

        $listBook.assignAll(listBook);
      }
    } on Exception catch (e) {
      InfoService.error('Terjadi kesalahan fetch data buku.');
      e.printError();
    } finally {
      lc.stopLoading();
    }
  }

  /// fungsi hapus buku
  Future<void> deleteBook(Book book) async {
    final lc = Get.find<LoadingController>();

    try {
      lc.showLoading('Menghapus buku...');
      final r = await BookA().deleteBook(book);
      if (!r.status.isOk) {
        // error
        InfoService.error('Terjadi kesalahan saat menghapus buku');
        print(r.statusText);
      } else {
        // success
        InfoService.success('Buku tersebut berhasil dihapus.');
      }
    } on Exception catch (e) {
      InfoService.error('Terjadi kesalahan fetch data buku.');
      e.printError();
    } finally {
      lc.stopLoading();
      await fetchBooks();
    }
  }
}
