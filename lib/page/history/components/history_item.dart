import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:unasman_library/page/member/components/student_text.dart';
import 'package:unasman_library/util/const.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        boxShadow: kDefaultCardShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // image
          AspectRatio(
            aspectRatio: 1.5 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding / 2),
                  topRight: Radius.circular(kDefaultPadding / 2),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/book.jpeg'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ).copyWith(
                  top: kDefaultPadding * 1.5, bottom: kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Status Peminjaman",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black.withOpacity(.7),
                                      fontWeight: FontWeight.w300,
                                      fontSize: kDefaultPadding * .8,
                                    ),
                          ),
                          SizedBox(
                            height: kDefaultPadding / 4,
                          ),
                          Text(
                            "Belum Dikembalikan",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: kSecondaryColor,
                                    ),
                          ),
                        ],
                      ),
                      Icon(
                        FeatherIcons.bookmark,
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Divider(),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 15,
                    children: [
                      StudentText(
                        label: 'Judul Buku',
                        text: 'Visual Foxpro',
                      ),
                      StudentText(
                        label: 'Anggota',
                        text: 'Kaco Jirris',
                      ),
                      StudentText(
                        label: 'Tanggal Peminjaman',
                        text: '20 Agustus 2021',
                      ),
                      StudentText(
                        label: 'Tanggal Pengembalian',
                        text: '-',
                      ),
                      StudentText(
                        label: 'Lama Peminjaman',
                        text: '-',
                      ),
                      StudentText(
                        label: 'Lama Peminjaman',
                        text: '20 hari',
                      ),
                    ],
                  ),

                  // Divider(),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {},
                  //       tooltip: 'Edit',
                  //       icon: Icon(
                  //         FeatherIcons.edit,
                  //         color: kPrimaryColor,
                  //       ),
                  //     ),
                  //     IconButton(
                  //       tooltip: 'Hapus',
                  //       onPressed: () {},
                  //       icon: Icon(
                  //         FeatherIcons.delete,
                  //         color: kSecondaryColor,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
