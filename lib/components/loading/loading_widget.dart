import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';
import 'package:unasman_library/util/const.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({Key? key}) : super(key: key);

  final LoadingController _controller = Get.find<LoadingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitWave(
            size: 30,
            color: kPrimaryColor,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Obx(() => Text("${_controller.$loadingText.value}")),
        ],
      ),
    );
  }
}
