// To parse this JSON data, do
//
//     final book = bookFromMap(jsonString);

import 'dart:convert';

Book bookFromMap(String str) => Book.fromMap(json.decode(str));

String bookToMap(Book data) => json.encode(data.toMap());

class Book {
  Book({
    required this.kode,
    required this.judul,
    required this.pengarang,
    required this.penerbit,
    required this.foto,
  });

  final String kode;
  final String judul;
  final String pengarang;
  final String penerbit;
  final String foto;

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        kode: json["kode"],
        judul: json["judul"],
        pengarang: json["pengarang"],
        penerbit: json["penerbit"],
        foto: json["foto"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "kode": kode,
        "judul": judul,
        "pengarang": pengarang,
        "penerbit": penerbit,
        "foto": foto,
      };
}
