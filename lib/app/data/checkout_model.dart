import 'package:get/get.dart';

class CheckoutModel {
  // Add a new field for the document ID
  final String? id;
  final String? namaBarang;
  final String? color;
  final String? waist;
  final String? length;
  final String? breadth;
  RxInt? quantity;
  final int? totalHarga;
  final String? image64;

  CheckoutModel({
    required this.id,
    required int quantity,
    required this.waist,
    required this.length,
    required this.breadth,
    required this.namaBarang,
    required this.color,
    required this.totalHarga,
    required this.image64,
  }) : quantity = RxInt(quantity);
}
