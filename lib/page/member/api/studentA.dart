import 'dart:io';

import 'package:get/get.dart';
import 'package:unasman_library/model/student_model.dart';
import 'package:unasman_library/util/const.dart';

class StudentA extends GetConnect {
  // url
  final String _studentUrl = kServerUrl + '/student';

  @override
  void onInit() {
    httpClient.baseUrl = _studentUrl;
    httpClient.defaultContentType = 'application/json';
  }

  Future<Response> fetchStudents() =>
      get(_studentUrl, contentType: 'application/json');

  Future<Response> postStudent(Student student, File? image) {
    final mapData = student.toMap();

    if (image != null) {
      mapData.putIfAbsent(
          'image', () => MultipartFile(image, filename: student.npm + '.jpg'));
    }
    final FormData form = FormData(mapData);
    return post(_studentUrl, form);
  }

  Future<Response> deleteStudent(Student student) =>
      delete(_studentUrl, query: student.toMap(), contentType: 'application/json');
}
