// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';

class OCRService {
  // fungsi untuk deteksi data text dengan OCR pada gambar tertentu
  static Future<String> scanImage(String imagePath) async {
    final loadingController = Get.find<LoadingController>();
    loadingController.showLoading('Memindai text...');

    //args android only, i don't have a mac
    final textDetector = GoogleMlKit.vision.textDetector();
    final inputImage = InputImage.fromFilePath(imagePath);
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);
    // String text = recognisedText.text;
    await textDetector.close();
    String text = '';
    for (TextBlock block in recognisedText.blocks) {
      String npm = getNPMFromText(block.text);
      if ((block.text.length >= 11) && (npm.length > 0)) {
        text = npm;
      }
    }

    loadingController.stopLoading();

    return text;
  }

  /// fungsi untuk proses text dari block text
  static String getNPMFromText(String textBlock) {
    String npm = textBlock;
    int angkaCounter = 0;
    if (textBlock.length >= 11) {
      for (int i = 0; i < textBlock.length; i++) {
        final char = (textBlock.substring(i, 1 + i));

        final isNumber = int.tryParse(char) != null;
        if (isNumber) {
          // angka
          angkaCounter += 1;
        } else {
          // bukan angka
          npm = npm.replaceAll(char, '');
        }
      }
    }
    if (angkaCounter >= 11) {
      if (npm.length > 11) {
        npm = npm.substring(0, 11);
      }
      return npm;
    } else {
      return '';
    }
  }

  /// fungsi untuk membuka kamera untuk melakukan scan data
  static Future<void> scan(BuildContext context) async {
    // final crop = Crop.of(context);
    final x = await ImagePicker().getImage(source: ImageSource.camera);

    if (x != null) {
      String pathFilePicked = x.path;
      String d = await scanImage(pathFilePicked);
      print(d);
    }
  }
}
