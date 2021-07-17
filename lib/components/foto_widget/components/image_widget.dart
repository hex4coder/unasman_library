import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unasman_library/util/const.dart';


class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.image,
    required this.onClearImage,
  }) : super(key: key);

  final File image;
  final VoidCallback onClearImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultPadding),
            color: Colors.black.withOpacity(.05),
            image: DecorationImage(
                image: FileImage(image), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
          child: GestureDetector(
            onTap: onClearImage,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                    color: Colors.black.withOpacity(.1),
                  ),
                ),
                Icon(Icons.cancel_outlined, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
