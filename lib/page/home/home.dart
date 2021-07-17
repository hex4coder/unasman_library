import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';
import 'package:unasman_library/components/loading/loading_widget.dart';
import 'package:unasman_library/page/book/book_screen.dart';
import 'package:unasman_library/page/history/history_screen.dart';
import 'package:unasman_library/page/member/student_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late PageController controller;

  final LoadingController _loadingController = Get.find<LoadingController>();

  @override
  void initState() {
    controller = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final s = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              if (!mounted) return;
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              BookScreen(),
              StudentScreen(),
              HistoryScreen(),
            ],
          ),
          Obx(
            () => _loadingController.$isLoading.value
                ? LoadingWidget()
                : Container(),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          if (!mounted) return;
          setState(() {
            currentIndex = index;
            controller.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.ease);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FeatherIcons.book,
              ),
              label: 'Buku'),
          BottomNavigationBarItem(
              icon: Icon(
                FeatherIcons.users,
              ),
              label: 'Anggota'),
          BottomNavigationBarItem(
              icon: Icon(
                FeatherIcons.activity,
              ),
              label: 'Peminjaman'),
        ],
      ),
    );
  }
}
