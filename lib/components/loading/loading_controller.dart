import 'package:get/get.dart';

class LoadingController extends GetxController {
  var $isLoading = false.obs;
  var $loadingText = ''.obs;

  void showLoading(String loadingText) {
    this.$loadingText.value = loadingText;
    this.$isLoading.value = true;
  }

  void stopLoading() {
    this.$isLoading.value = false;
  }
}
