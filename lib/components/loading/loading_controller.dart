import 'package:get/get.dart';

class LoadingController extends GetxController {
  var $isLoading = false.obs;
  var $loadingText = ''.obs;

  void showLoading(String loadingText) {
    this.$isLoading.value = true;
    print("Show loading $loadingText");
    this.$loadingText.value = loadingText;
  }

  void stopLoading() {
    this.$isLoading.value = false;
  }
}
