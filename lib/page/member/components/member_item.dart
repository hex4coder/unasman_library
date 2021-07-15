import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:unasman_library/util/const.dart';

import 'member_text.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({
    Key? key,
  }) : super(key: key);

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
        mainAxisSize: MainAxisSize.max,
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
                  FittedBox(
                    child: Text(
                      "Kaco Jirris",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding / 4,
                  ),
                  Text("2012329320"),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 15,
                    children: [
                      MemberText(
                        label: 'Fakultas',
                        text: 'Ilmu Komputer',
                      ),
                      MemberText(
                        label: 'Jurusan',
                        text: 'Sistem Informasi',
                      ),
                      MemberText(
                        label: 'Nomor HP',
                        text: '082284938439',
                      ),
                      MemberText(
                        label: 'Alamat',
                        text: 'Jln. Poros Mambu Desa Baru, Kec. Luyo',
                      ),
                    ],
                  ),

                  // Divider(),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        tooltip: 'Edit',
                        icon: Icon(
                          FeatherIcons.edit,
                          color: kPrimaryColor,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Hapus',
                        onPressed: () {},
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
