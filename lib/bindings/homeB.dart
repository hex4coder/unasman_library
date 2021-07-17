import 'package:get/get.dart';
import 'package:unasman_library/components/foto_widget/controller/fotoC.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';
import 'package:unasman_library/page/book/controller/bookC.dart';
import 'package:unasman_library/page/member/controller/studentC.dart';

class HomeB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingController());
    Get.lazyPut(() => FotoC());
    Get.lazyPut(() => BookC());
    Get.lazyPut(() => StudentC());
  }
}
