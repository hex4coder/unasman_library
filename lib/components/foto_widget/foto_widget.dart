import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/card_widget.dart';
import 'package:unasman_library/components/foto_widget/controller/fotoC.dart';
import 'components/image_widget.dart';
import 'components/no_image_widget.dart';

class FotoWidget extends StatelessWidget {
  const FotoWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      title: title,
      child: GetX<FotoC>(builder: (c) {
        if (!c.isImageExists()) {
          return GestureDetector(
            child: NoImageWidget(
              title: '$title',
            ),
            onTap: () => c.takeNewImage(),
          );
        } else {
          return ImageWidget(
            image: c.$image.value,
            onClearImage: () => c.clearImage(),
          );
        }
      }),
    );
  }
}
