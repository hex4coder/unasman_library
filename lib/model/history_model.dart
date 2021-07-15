// To parse this JSON data, do
//
//     final history = historyFromMap(jsonString);
import 'dart:convert';

History historyFromMap(String str) => History.fromMap(json.decode(str));

String historyToMap(History data) => json.encode(data.toMap());

class History {
  History({
    required this.npmMahasiswa,
    required this.kodeBuku,
    required this.tanggalPeminjaman,
    required this.tanggalPengembalian,
    required this.status,
    required this.denda,
  });

  final String npmMahasiswa;
  final String kodeBuku;
  final String tanggalPeminjaman;
  final String tanggalPengembalian;
  final String status;
  final String denda;

  factory History.fromMap(Map<String, dynamic> json) => History(
        npmMahasiswa: json["npm_mahasiswa"],
        kodeBuku: json["kode_buku"],
        tanggalPeminjaman: json["tanggal_peminjaman"],
        tanggalPengembalian: json["tanggal_pengembalian"],
        status: json["status"],
        denda: json["denda"],
      );

  Map<String, dynamic> toMap() => {
        "npm_mahasiswa": npmMahasiswa,
        "kode_buku": kodeBuku,
        "tanggal_peminjaman": tanggalPeminjaman,
        "tanggal_pengembalian": tanggalPengembalian,
        "status": status,
        "denda": denda,
      };
}
