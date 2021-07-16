import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:unasman_library/components/animations/slidein_fromtop.dart';
import 'package:unasman_library/components/appbar_widget.dart';
import 'package:unasman_library/page/history/components/history_item.dart';
import 'package:unasman_library/util/const.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

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
              child: HistoryItem(),
            ),
            itemCount: 3,
          ),

          // app bar
          CustomAppbar(
            leading: SizedBox(
              width: 50,
            ),
            title: 'Peminjaman Buku',
            iconTitle: FeatherIcons.barChart,
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
