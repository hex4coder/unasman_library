import 'package:flutter/material.dart';
import 'package:unasman_library/util/const.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        boxShadow: kDefaultCardShadow,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          child,
        ],
      ),
    );
  }
}
