import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:unasman_library/model/student_model.dart';
import 'package:unasman_library/util/const.dart';

import 'student_text.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({
    Key? key,
    required this.student,
  }) : super(key: key);

  final Student student;

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
                  image: NetworkImage(kServerUrl + '/' + student.foto),
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
                      "${student.nama}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding / 4,
                  ),
                  Text("${student.npm}"),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 15,
                    children: [
                      StudentText(
                        label: 'Fakultas',
                        text: '${student.fakultas}',
                      ),
                      StudentText(
                        label: 'Jurusan',
                        text: '${student.jurusan}',
                      ),
                      StudentText(
                        label: 'Nomor HP',
                        text: '${student.nomorhp}',
                      ),
                      StudentText(
                        label: 'Alamat',
                        text: '${student.alamat}',
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
