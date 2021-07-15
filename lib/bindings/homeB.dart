import 'package:get/get.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';

class HomeB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingController());
  }
}
