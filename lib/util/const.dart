import 'package:flutter/material.dart';

final kDefaultPadding = 16.0;
final kPrimaryColor = Color(0xff1e90ff);
final kAccentColor = Color(0xff70a1ff);
final kTextDarkColor = Color(0xff2f3542);
final kTextColor = Color(0xff57606f);
final kBackgroundColor = Color(0xffecf0f1);
final kSecondaryColor = Color(0xfff39c12);

final kDefaultCardShadow = [
  BoxShadow(
    offset: Offset(0, 10),
    blurRadius: 30,
    color: Colors.black.withOpacity(.1),
  )
];

final kServerUrl = 'http://192.168.42.78:5000';

final kListFakultas = {
  'ILMU KOMPUTER': ['TEKNIK INFORMATIKA', 'SISTEM INFORMASI'],
  'AGAMA ISLAM': ['EKONOMI SYARIAH'],
  'KESEHATAN MASYARAKAT': ['KESEHATAN MASYARAKAT'],
  'ILMU SOSIAL & ILMU PEMERINTAHAN': ['ILMU KOMUNIKASI', 'ILMU PEMERINTAHAN'],
  'ILMU PERTANIAN': ['AGROTEKNOLOGI', 'AGRIBISNIS', 'PETERNAKAN'],
  'KEGURUAN DAN ILMU PENDIDIKAN': ['MATEMATIKA', 'PKN', 'BAHASA INDONESIA'],
};
