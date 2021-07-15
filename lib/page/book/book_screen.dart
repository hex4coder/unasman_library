import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:unasman_library/components/animations/slidein_fromtop.dart';
import 'package:unasman_library/components/appbar_widget.dart';
import 'package:unasman_library/util/const.dart';

import 'components/book_item.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          // list data
          ListView.builder(
            padding: EdgeInsets.only(top: 50),
            shrinkWrap: true,
            itemBuilder: (_, index) => SlideInFromTopAnimation(
              child: BookItem(),
            ),
            itemCount: 3,
          ),

          // app bar
          CustomAppbar(
            leading: SizedBox(
              width: 50,
            ),
            title: 'Daftar Buku',
            iconTitle: FeatherIcons.book,
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.plusCircle,
                color: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
