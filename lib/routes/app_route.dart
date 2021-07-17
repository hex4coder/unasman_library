import 'package:get/get.dart';
import 'package:unasman_library/bindings/homeB.dart';
import 'package:unasman_library/page/book/addbook_screen.dart';
import 'package:unasman_library/page/home/home.dart';
import 'package:unasman_library/page/member/addstudent_screen.dart';
import 'package:unasman_library/page/splash/splash_screen.dart';
import 'package:unasman_library/routes/route_name.dart';

class AppRoute {
  static final pages = [
    GetPage(name: RouteName.splash, page: () => SplashScreen()),
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
      binding: HomeB(),
    ),
    GetPage(
      name: RouteName.addBook,
      page: () => AddBookScreen(),
      binding: HomeB(),
    ),
    GetPage(
      name: RouteName.addStudent,
      page: () => AddStudentScreen(),
      binding: HomeB(),
    ),
  ];
}
