// To parse this JSON data, do
//
//     final student = studentFromMap(jsonString);

import 'dart:convert';

Student studentFromMap(String str) => Student.fromMap(json.decode(str));

String studentToMap(Student data) => json.encode(data.toMap());

class Student {
    Student({
        required this.nama,
        required this.npm,
        required this.jurusan,
        required this.fakultas,
        required this.alamat,
    });

    final String nama;
    final String npm;
    final String jurusan;
    final String fakultas;
    final String alamat;

    factory Student.fromMap(Map<String, dynamic> json) => Student(
        nama: json["nama"],
        npm: json["npm"],
        jurusan: json["jurusan"],
        fakultas: json["fakultas"],
        alamat: json["alamat"],
    );

    Map<String, dynamic> toMap() => {
        "nama": nama,
        "npm": npm,
        "jurusan": jurusan,
        "fakultas": fakultas,
        "alamat": alamat,
    };
}
