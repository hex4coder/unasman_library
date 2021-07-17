import 'package:flutter/material.dart';
import 'package:unasman_library/util/const.dart';

class StudentText extends StatelessWidget {
  const StudentText({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  final String label, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: kDefaultPadding * .8,
                color: Colors.black.withOpacity(.4),
              ),
        ),
        Text(
          "$text",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
