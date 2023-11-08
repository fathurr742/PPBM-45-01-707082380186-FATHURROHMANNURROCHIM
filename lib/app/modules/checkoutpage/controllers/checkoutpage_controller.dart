import 'package:e_commerce/app/data/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

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

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '192.168.137.1',
      port: 3306,
      user: 'flutter',
      password: 'malammakan',
      db: 'latihan_flutter',
    ));

    try {
      final results = await conn.query(
          'SELECT id, nama_barang, color, quantity, total_harga FROM tb_order');

      final data = results.map((row) {
        final id = row['id'] as int;
        final namaBarang = row['nama_barang'] as String;
        final color = row['color'] as String;
        final quantity = row['quantity'] as int;
        final totalHarga = row['total_harga'] as int;

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
    } finally {
      await conn.close();
    }
  }

  Future<void> delete(int id) async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '192.168.137.1',
      port: 3306,
      user: 'flutter',
      password: 'malammakan',
      db: 'latihan_flutter',
    ));

    try {
      await conn.query('DELETE FROM tb_barang WHERE id = ?', [id]);
      items.removeWhere((item) => item.id == id);
    } catch (e) {
      Get.snackbar(
          backgroundColor: Colors.pink,
          colorText: Colors.white,
          'Error',
          'Data gagal dihapus');
    } finally {
      await conn.close();
    }
  }
}
