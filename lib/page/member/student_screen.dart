import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/animations/slidein_fromtop.dart';
import 'package:unasman_library/components/appbar_widget.dart';
import 'package:unasman_library/page/member/components/student_item.dart';
import 'package:unasman_library/services/ocr_service.dart';
import 'package:unasman_library/util/const.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({Key? key}) : super(key: key);


  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // list data
        Obx(() {


          return ListView.builder(
            padding: EdgeInsets.only(top: 50),
            shrinkWrap: true,
            itemBuilder: (_, index) => SlideInFromTopAnimation(
              child: StudentItem(),
            ),
            itemCount: 3,
          );
        }),

        // app bar
        CustomAppbar(
          leading: SizedBox(
            width: 50,
          ),
          title: 'Anggota Perpustakaan',
          iconTitle: FeatherIcons.creditCard,
          trailing: IconButton(
            onPressed: () async {
              // buka kamera dengan image picker
              await OCRService.scan(context);
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
