import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:unasman_library/util/const.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.black.withOpacity(.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FeatherIcons.image,
            size: 40,
            color: kSecondaryColor,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Text(
            'Ambil $title',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: kDefaultPadding * .8,
                ),
          ),
        ],
      ),
    );
  }
}
