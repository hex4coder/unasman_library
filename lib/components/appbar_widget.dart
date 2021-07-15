import 'package:flutter/material.dart';
import 'package:unasman_library/util/const.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
    required this.title,
    required this.iconTitle,
    required this.leading, 
    required this.trailing,
  }) : super(key: key);

  final Widget leading, trailing;
  final String title;
  final IconData iconTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(.2),
          ),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: Colors.black.withOpacity(.2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            children: [
              Icon(
                iconTitle,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: kDefaultPadding / 2,
              ),
              Text(
                "$title",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
