import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/animations/slidein_fromtop.dart';
import 'package:unasman_library/components/appbar_widget.dart';
import 'package:unasman_library/page/member/components/student_item.dart';
import 'package:unasman_library/page/member/controller/studentC.dart';
import 'package:unasman_library/routes/route_name.dart';
import 'package:unasman_library/services/ocr_service.dart';
import 'package:unasman_library/util/const.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({Key? key}) : super(key: key);

  final c = Get.find<StudentC>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // list data
        Obx(() {
          if (c.$listStudent.length < 1) {
            // tidak ada buku
            return Center(
              child: Text('Belum ada data'),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.only(top: 50),
            shrinkWrap: true,
            itemBuilder: (_, index) => SlideInFromTopAnimation(
              child: StudentItem(
                student: c.$listStudent[index],
              ),
            ),
            itemCount: c.$listStudent.length,
          );
        }),
        // app bar
        CustomAppbar(
          leading: IconButton(
            onPressed: () async => await c.fetchStudents(),
            icon: Icon(
              FeatherIcons.refreshCcw,
              color: kPrimaryColor,
            ),
          ),
          title: 'Anggota Perpustakaan',
          iconTitle: FeatherIcons.creditCard,
          trailing: IconButton(
            onPressed: () async {
              await Get.toNamed(RouteName.addStudent);
              await c.fetchStudents();
            },
            icon: Icon(
              FeatherIcons.userPlus,
              color: kSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
