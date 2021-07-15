import 'package:flutter/material.dart';
import 'package:unasman_library/util/const.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // logo unasman
        Image.asset('assets/img/unasman.png'),
        SizedBox(
          height: kDefaultPadding * 2,
        ),

        // text
        Text(
          "E-Library Management",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Text(
          "Versi 1.0",
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.black.withOpacity(.8)),
        ),
      ],
    );
  }
}
