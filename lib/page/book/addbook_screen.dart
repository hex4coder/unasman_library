import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/appbar_widget.dart';
import 'package:unasman_library/components/card_widget.dart';
import 'package:unasman_library/components/foto_widget/controller/fotoC.dart';
import 'package:unasman_library/components/foto_widget/foto_widget.dart';
import 'package:unasman_library/util/const.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  void backToMain() {
    final fotoC = Get.find<FotoC>();
    fotoC.clearImage();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // pastikan controller foto sudah bersih
        backToMain();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox.expand(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.symmetric(
                      vertical: kDefaultPadding, horizontal: kDefaultPadding),
                  height: MediaQuery.of(context).size.height - 50,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: kDefaultPadding,
                        ),

                        // get foto widget
                        FotoWidget(
                          title: 'Foto Buku',
                        ),

                        SizedBox(
                          height: kDefaultPadding * 2,
                        ),

                        // form builders
                        CardWidget(
                          title: 'Data Buku',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomAppbar(
                title: 'Tambah Buku',
                iconTitle: FeatherIcons.bookOpen,
                leading: IconButton(
                    onPressed: () => backToMain(),
                    icon: Icon(FeatherIcons.arrowLeft)),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FeatherIcons.save,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
