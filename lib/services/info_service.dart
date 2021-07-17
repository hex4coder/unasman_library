import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoService {
  static void error(String textMessage) {
    Get.snackbar('Error', '$textMessage',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade600,
              colorText: Colors.white);
  }


  static void success(String textMessage) {
    Get.snackbar('Success', '$textMessage',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.blue.shade600,
              colorText: Colors.white);
  }
}