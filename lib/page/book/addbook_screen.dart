import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/appbar_widget.dart';
import 'package:unasman_library/components/card_widget.dart';
import 'package:unasman_library/components/foto_widget/controller/fotoC.dart';
import 'package:unasman_library/components/foto_widget/foto_widget.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';
import 'package:unasman_library/components/loading/loading_widget.dart';
import 'package:unasman_library/model/book_model.dart';
import 'package:unasman_library/page/book/api/bookA.dart';
import 'package:unasman_library/page/book/controller/bookC.dart';
import 'package:unasman_library/services/info_service.dart';
import 'package:unasman_library/services/qrbar_service.dart';
import 'package:unasman_library/util/const.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _fbKey = GlobalKey<FormBuilderState>();

  void submitForm() async {
    final fotoC = Get.find<FotoC>();

    if (_fbKey.currentState!.saveAndValidate() && fotoC.isImageExists()) {
      final mapForm = _fbKey.currentState!.value;
      final book = Book.fromMap(mapForm);
      final lc = Get.find<LoadingController>();
      final bc = Get.find<BookC>();
      try {
        lc.showLoading('Mengentri buku ...');
        final r = await BookA().postBook(book, fotoC.$image.value);
        lc.stopLoading();
        await Future.delayed(Duration(milliseconds: 10));

        if (r.hasError) {
          InfoService.error('Terjadi kesalahan saat entri buku.');
          r.status.printError();
        } else {
          backToMain();

          InfoService.success('Data buku telah ditambahkan');
          await bc.fetchBooks();
        }
      } catch (e) {
        lc.stopLoading();
        await Future.delayed(Duration(milliseconds: 10));
        InfoService.error('Terjadi kesalahan saat entri buku.');
        print('POST Buku Error ' + e.toString());
      }
    }
  }

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
                        BookForm(fbKey: _fbKey),
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
                  onPressed: () => submitForm(),
                  icon: Icon(
                    FeatherIcons.save,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              GetX<LoadingController>(builder: (c) {
                print(c.$isLoading.value);
                if (c.$isLoading.value) {
                  return SizedBox.expand(child: LoadingWidget());
                } else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

class BookForm extends StatelessWidget {
  const BookForm({
    Key? key,
    required GlobalKey<FormBuilderState> fbKey,
  })  : _fbKey = fbKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _fbKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _fbKey,
      autovalidateMode: AutovalidateMode.always,
      child: CardWidget(
        title: 'Data Buku',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'kode',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: 'Wajib diisi'),
                    ]),
                    decoration: InputDecoration(
                      labelText: 'Kode Buku',
                      labelStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final barcodeText = await BarcodeService.scanBarcode();

                    _fbKey.currentState!.patchValue({'kode': barcodeText});
                  },
                  child: Column(
                    children: [
                      Icon(
                        FeatherIcons.camera,
                      ),
                      Text('Scan')
                    ],
                  ),
                ),
              ],
            ),
            FormBuilderTextField(
              name: 'judul',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: 'Wajib diisi'),
              ]),
              decoration: InputDecoration(
                labelText: 'Judul Buku',
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            FormBuilderTextField(
              name: 'pengarang',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: 'Wajib diisi'),
              ]),
              decoration: InputDecoration(
                labelText: 'Pengarang',
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            FormBuilderTextField(
              name: 'penerbit',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: 'Wajib diisi'),
              ]),
              decoration: InputDecoration(
                labelText: 'Penerbit Buku',
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
