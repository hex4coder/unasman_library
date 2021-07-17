import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unasman_library/model/book_model.dart';
import 'package:unasman_library/page/book/controller/bookC.dart';
import 'package:unasman_library/util/const.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 550,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        boxShadow: kDefaultCardShadow,
      ),
      child: Column(
        children: [
          // image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding / 2),
                  topRight: Radius.circular(kDefaultPadding / 2),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(kServerUrl + '/' + book.foto),
                ),
              ),
            ),
            flex: 2,
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
                  FittedBox(
                    child: Text(
                      "${book.judul}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding / 4,
                  ),
                  Text("${book.pengarang}"),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text(
                    "${book.penerbit}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  // Divider(),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconButton(
                      //   onPressed: () {},
                      //   tooltip: 'Edit',
                      //   icon: Icon(
                      //     FeatherIcons.edit,
                      //     color: kPrimaryColor,
                      //   ),
                      // ),
                      IconButton(
                        tooltip: 'Hapus',
                        onPressed: () async {
                          final c = Get.find<BookC>();
                          await c.deleteBook(book);
                        },
                        icon: Icon(
                          FeatherIcons.delete,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
