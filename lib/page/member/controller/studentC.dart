import 'dart:convert';

import 'package:get/get.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';
import 'package:unasman_library/model/student_model.dart';
import 'package:unasman_library/page/member/api/studentA.dart';
import 'package:unasman_library/services/info_service.dart';

class StudentC extends GetxController {
  /// vars
  var $listStudent = <Student>[].obs;

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  Future<void> fetchStudents() async {
    final lc = Get.find<LoadingController>();

    try {
      lc.showLoading('Memuat data buku...');
      final response = await StudentA().fetchStudents();
      if (response.isOk) {
        String body = response.body;
        List jsonData = jsonDecode(body);
        List<Student> listStudent = [];

        jsonData.forEach((j) {
          final book = Student.fromMap(j);
          listStudent.add(book);
        });

        $listStudent.assignAll(listStudent);
      }
    } on Exception catch (e) {
      InfoService.error('Terjadi kesalahan fetch data buku.');
      e.printError();
    } finally {
      lc.stopLoading();
    }
  }

  /// fungsi hapus buku
  Future<void> deleteStudent(Student book) async {
    final lc = Get.find<LoadingController>();

    try {
      lc.showLoading('Menghapus buku...');
      final r = await StudentA().deleteStudent(book);
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
      await fetchStudents();
    }
  }
}
