import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
class Item {
  final int id; // Ubah tipe data menjadi int
  final String nim;
  final String nama;
  final String ttl;
  final String prodi;
  final String alamat;
  final String kec;
  final String kab;
  final String tanggalsc;
  final String waktusc;
  final String imageUrl;
  final String wajahUrl;
  final String status;

  Item({
    required this.id, // Ubah tipe data menjadi int
    required this.nim,
    required this.nama,
    required this.ttl,
    required this.prodi,
    required this.alamat,
    required this.kec,
    required this.kab,
    required this.tanggalsc,
    required this.waktusc,
    required this.imageUrl,
    required this.wajahUrl,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nim': nim,
      'nama': nama,
      'ttl': ttl,
      'prodi': prodi,
      'alamat': alamat,
      'kecamatan': kec,
      'kabupaten': kab,
      'berlaku': tanggalsc,
      'waktusc': waktusc,
      'imageUrl': imageUrl,
      'wajahUrl': wajahUrl,
      'status': status,
    };
  }

  factory Item.fromJson(Map<String, dynamic> data) {
    return Item(
      id: data['id'] ?? 0, // Pastikan bahwa nilai id selalu bertipe int
      nim: data['nim'] ?? '',
      nama: data['nama'] ?? '',
      ttl: data['ttl'] ?? '',
      prodi: data['prodi'] ?? '',
      alamat: data['alamat'] ?? '',
      kec: data['kecamatan'] ?? '',
      kab: data['kabupaten'] ?? '',
      waktusc: data['waktusc'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      wajahUrl: data['wajahUrl'] ?? '',
      status: data['status'] ?? '',
      tanggalsc: data['berlaku'] ?? '',
    );
  }
}



class FirestoreService {
  final CollectionReference items = FirebaseFirestore.instance.collection('items');

  Future<void> createItem(Item item) async {
    await items.add(item.toJson());
  }
}
