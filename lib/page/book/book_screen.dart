import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/animations/slidein_fromtop.dart';
import 'package:unasman_library/components/appbar_widget.dart';
import 'package:unasman_library/page/book/controller/bookC.dart';
import 'package:unasman_library/routes/route_name.dart';
import 'package:unasman_library/util/const.dart';

import 'components/book_item.dart';

class BookScreen extends StatelessWidget {
  BookScreen({Key? key}) : super(key: key);

  final c = Get.find<BookC>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // list data
        Obx(() {
          if (c.$listBook.length < 1) {
            // tidak ada buku
            return Center(
              child: Text('Belum ada data'),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.only(top: 50),
            shrinkWrap: true,
            itemBuilder: (_, index) => SlideInFromTopAnimation(
              child: BookItem(
                book: c.$listBook[index],
              ),
            ),
            itemCount: c.$listBook.length,
          );
        }),

        // app bar
        CustomAppbar(
          leading: SizedBox(
            width: 100,
          ),
          title: 'Daftar Buku',
          iconTitle: FeatherIcons.book,
          trailing: Row(
            children: [
              IconButton(
                onPressed: () async {
                  await Get.toNamed(RouteName.addBook);
                  await c.fetchBooks();
                },
                icon: Icon(
                  FeatherIcons.plusCircle,
                  color: kSecondaryColor,
                ),
              ),
              IconButton(
                onPressed: () async => await c.fetchBooks(),
                icon: Icon(
                  FeatherIcons.refreshCcw,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
