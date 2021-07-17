import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unasman_library/components/appbar_widget.dart';
import 'package:unasman_library/components/card_widget.dart';
import 'package:unasman_library/components/foto_widget/controller/fotoC.dart';
import 'package:unasman_library/components/foto_widget/foto_widget.dart';
import 'package:unasman_library/components/loading/loading_controller.dart';
import 'package:unasman_library/components/loading/loading_widget.dart';
import 'package:unasman_library/model/student_model.dart';
import 'package:unasman_library/services/info_service.dart';
import 'package:unasman_library/services/ocr_service.dart';
import 'package:unasman_library/services/qrbar_service.dart';
import 'package:unasman_library/util/const.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'api/studentA.dart';
import 'controller/studentC.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _fbKey = GlobalKey<FormBuilderState>();

  void submitForm() async {
    final fotoC = Get.find<FotoC>();

    if (_fbKey.currentState!.saveAndValidate() && fotoC.isImageExists()) {
      final mapForm = _fbKey.currentState!.value;
      final book = Student.fromMap(mapForm);
      final lc = Get.find<LoadingController>();
      final bc = Get.find<StudentC>();
      try {
        lc.showLoading('Mengentri anggota ...');
        final r = await StudentA().postStudent(book, fotoC.$image.value);
        lc.stopLoading();
        await Future.delayed(Duration(milliseconds: 10));

        if (r.hasError) {
          InfoService.error('Terjadi kesalahan saat entri anggota.');
          r.status.printError();
        } else {
          backToMain();

          InfoService.success('Data anggota telah ditambahkan');
          await bc.fetchStudents();
        }
      } catch (e) {
        lc.stopLoading();
        await Future.delayed(Duration(milliseconds: 10));
        InfoService.error('Terjadi kesalahan saat entri anggota.');
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
                          title: 'Foto Kartu Mahasiswa',
                        ),

                        SizedBox(
                          height: kDefaultPadding * 2,
                        ),

                        // form builders
                        StudentForm(fbKey: _fbKey),
                      ],
                    ),
                  ),
                ),
              ),
              CustomAppbar(
                title: 'Tambah Anggota',
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

class StudentForm extends StatefulWidget {
  const StudentForm({
    Key? key,
    required GlobalKey<FormBuilderState> fbKey,
  })  : _fbKey = fbKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _fbKey;

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  List<String> currentListJurusan = kListFakultas[kListFakultas.keys.first]!;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget._fbKey,
      autovalidateMode: AutovalidateMode.always,
      child: CardWidget(
        title: 'Data Anggota',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'npm',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: 'Wajib diisi'),
                    ]),
                    decoration: InputDecoration(
                      labelText: 'NPM / NIM',
                      labelStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final String npm = await OCRService.scan(context);

                    widget._fbKey.currentState!.patchValue({'npm': npm});
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
              name: 'nama',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: 'Wajib diisi'),
              ]),
              decoration: InputDecoration(
                labelText: 'Nama Mahasiswa',
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            FormBuilderTextField(
              name: 'alamat',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: 'Wajib diisi'),
              ]),
              decoration: InputDecoration(
                labelText: 'Alamat',
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            FormBuilderTextField(
              name: 'nomorhp',
              keyboardType: TextInputType.phone,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: 'Wajib diisi'),
              ]),
              decoration: InputDecoration(
                labelText: 'Nomor HP',
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            FormBuilderDropdown(
              name: 'fakultas',
              initialValue: kListFakultas.keys.first,
              items: kListFakultas.keys
                  .map(
                    (fak) => DropdownMenuItem(
                      child: Text('$fak'),
                      value: fak,
                      onTap: () {
                        // ignore: unnecessary_statements

                        if (!mounted) return;

                        setState(() {
                          currentListJurusan = kListFakultas[fak]!;
                          this
                              .widget
                              ._fbKey
                              .currentState!
                              .patchValue({'jurusan': currentListJurusan[0]});
                        });
                      },
                    ),
                  )
                  .toList(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: 'Wajib dipilih'),
              ]),
              decoration: InputDecoration(
                labelText: 'Fakultas',
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            FormBuilderDropdown(
              name: 'jurusan',
              items: currentListJurusan
                  .map(
                    (jur) => DropdownMenuItem(
                      child: Text('$jur'),
                      value: jur,
                    ),
                  )
                  .toList(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: 'Wajib dipilih'),
              ]),
              decoration: InputDecoration(
                labelText: 'Jurusan',
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
