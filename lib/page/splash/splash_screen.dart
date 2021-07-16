import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/logo_widget.dart';
import 'package:unasman_library/util/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // setelah 5 detik, maka lanjut ke homepage
    Timer(Duration(seconds: 5), () {
      Get.offAllNamed('/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoWidget(),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          // progress
          SpinKitWave(
            size: 30,
            color: kPrimaryColor,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          // loading text
          Text(
            "Loading...",
          ),
        ],
      ),
    );
  }
}
