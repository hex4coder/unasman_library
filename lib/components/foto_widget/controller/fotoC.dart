import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FotoC extends GetxController {
  Rx<File> $image = File('').obs;
  var $isImageExists = false.obs;

  void takeNewImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      $image.value = File(pickedFile.path);
    }
  }

  void clearImage() {
    $image.value = File('');
  }

  @override
  void onInit() {
    ever<File>($image, (_) async {
      final exists = await _.exists();
      $isImageExists.value = exists;
    });

    super.onInit();
  }

  bool isImageExists() => $isImageExists.value;
}
