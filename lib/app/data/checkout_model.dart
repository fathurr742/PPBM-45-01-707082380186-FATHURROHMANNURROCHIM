import 'package:get/get.dart';

class CheckoutModel {
  final String? namaBarang;
  final String? color;
  final String? waist;
  final String? length;
  final String? breadth;
  RxInt? quantity;
  final int? totalHarga;
  final String? image64;

  CheckoutModel({
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
