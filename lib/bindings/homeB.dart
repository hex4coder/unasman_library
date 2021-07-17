import 'package:get/get.dart';
import 'package:unasman_library/components/foto_widget/controller/fotoC.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';
import 'package:unasman_library/page/book/controller/bookC.dart';

class HomeB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingController());
    Get.lazyPut(() => BookC());
    Get.lazyPut(() => FotoC());
  }
}
