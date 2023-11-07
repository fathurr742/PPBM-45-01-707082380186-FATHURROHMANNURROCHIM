import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

class DetailItemController extends GetxController
    // ignore: deprecated_member_use
    with
        SingleGetTickerProviderMixin {
  late TextEditingController waist;
  late TextEditingController length;
  late TextEditingController breadth;

  var selectedColor = 'Red'.obs;
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

  Future<void> insertData(int total_harga, String namaBarang) async {
    final waistValue = waist.text;
    final lengthValue = length.text;
    final breadthValue = breadth.text;
    final selectedColorValue = selectedColor.value;
    final quantityValue = quantity.value;

    Get.dialog(
      Theme(
        data: ThemeData(dialogBackgroundColor: Colors.pink),
        child: AlertDialog(
          title: Text('Confirm Order', style: TextStyle(color: Colors.white)),
          content: Text('Are you sure you want to place this order?',
              style: TextStyle(color: Colors.white)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Get.back(result: false);
              },
            ),
            TextButton(
              child: Text('Confirm', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                Get.back(closeOverlays: true);

                final result = await conn.query(
                  'INSERT INTO tb_order (nama_barang, waist, length, breadth, color, quantity, total_harga) VALUES (?, ?, ?, ?, ?, ?, ?)',
                  [
                    namaBarang,
                    waistValue,
                    lengthValue,
                    breadthValue,
                    selectedColorValue,
                    quantityValue,
                    total_harga
                  ],
                );

                if (result.affectedRows == 1) {
                  Get.snackbar(
                      backgroundColor: Colors.pink,
                      colorText: Colors.white,
                      'Success',
                      'Item successfully added to cart');
                } else {
                  Get.snackbar('Error', 'Data gagal ditambahkan');
                }

                // Show Snackbar and navigate to homepage here
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onClose() {
    conn.close();
    super.onClose();
  }
}
