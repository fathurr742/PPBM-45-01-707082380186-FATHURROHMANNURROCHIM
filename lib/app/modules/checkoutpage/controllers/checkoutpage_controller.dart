import 'package:e_commerce/app/data/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BarangModel {
  final int? id;
  final String namaBarang;
  final String color;
  final int quantity;

  BarangModel(
      {required this.id,
      required this.namaBarang,
      required this.color,
      required this.quantity});
}

class CheckoutpageController extends GetxController {
  final items = <CheckoutModel>[].obs;
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final result = await firestore.collection('tb_order').get();
      final data = result.docs.map((doc) {
        final data = doc.data();
        final id = data['id'] != null ? data['id'] as int : null;
        final namaBarang =
            data['nama_barang'] != null ? data['nama_barang'] as String : null;
        final color = data['color'] != null ? data['color'] as String : null;
        final quantity =
            data['quantity'] != null ? data['quantity'] as int : null;
        final totalHarga =
            data['total_harga'] != null ? data['total_harga'] as int : null;

        return CheckoutModel(
            id: id,
            namaBarang: namaBarang,
            color: color,
            quantity: quantity,
            totalHarga: totalHarga);
      }).toList();

      items.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {}
  }

  Future<void> delete(int id) async {
    try {
      await firestore.collection('tb_order').doc(id.toString()).delete();
      items.removeWhere((item) => item.id == id);
    } catch (e) {
      Get.snackbar(
          backgroundColor: Colors.pink,
          colorText: Colors.white,
          'Error',
          'Data gagal dihapus');
    }
  }
}
