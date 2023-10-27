import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class DetailItemController extends GetxController
    with SingleGetTickerProviderMixin {
  late TextEditingController waist;
  late TextEditingController length;
  late TextEditingController breadth;

  final Rx<Color> selectedColor = Colors.red.obs;
  late TabController tabController;
  final RxInt quantity = 1.obs;

  late MySqlConnection conn;

  @override
  void onInit() async {
    waist = TextEditingController(); // Initialize the waist field
    length = TextEditingController(); // Initialize the length field
    breadth = TextEditingController(); // Initialize the breadth field

    tabController = TabController(length: 3, vsync: this);
    conn = await MySqlConnection.connect(ConnectionSettings(
      host: '192.168.137.1',
      port: 3306,
      user: 'flutter',
      password: 'malammakan',
      db: 'latihan_flutter',
    ));

    super.onInit();
  }

  Future<void> insertData() async {
    final nama_barang = "PERFECT BLUE SUIT";
    final waistValue = waist.text;
    final lengthValue = length.text;
    final breadthValue = breadth.text;
    final selectedColorValue = selectedColor.value;
    final quantityValue = quantity.value;

    final result = await conn.query(
      'INSERT INTO tb_barang (nama_barang, waist, length, breadth, color, quantity) VALUES (?, ?, ?, ?, ?, ?)',
      [
        nama_barang,
        waistValue,
        lengthValue,
        breadthValue,
        selectedColorValue.toString(),
        quantityValue
      ],
    );

    print('Inserted ${result.affectedRows} row(s)');
  }

  @override
  void onClose() {
    conn.close();
    super.onClose();
  }
}
