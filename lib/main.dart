import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unasman_library/page/splash/splash_screen.dart';
import 'package:unasman_library/routes/app_route.dart';
import 'package:unasman_library/util/const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unasman Library Mobile',
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        canvasColor: kBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme()
            .apply(
              bodyColor: Colors.black,
            )
            .copyWith(
              bodyText1: TextStyle(
                color: kTextColor,
              ),
              bodyText2: TextStyle(
                color: kTextColor,
              ),
              subtitle1: TextStyle(
                color: kTextDarkColor,
              ),
              subtitle2: TextStyle(
                color: kTextColor,
              ),
            ),
      ),
      getPages: AppRoute.pages,
      home: SplashScreen(),
    );
  }
}
