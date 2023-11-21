// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailItemController extends GetxController
    with SingleGetTickerProviderMixin {
  late TextEditingController waist;
  late TextEditingController length;
  late TextEditingController breadth;

  var selectedColor = 'Red'.obs;
  late TabController tabController;
  final RxInt quantity = 1.obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() async {
    waist = TextEditingController(); // Initialize the waist field
    length = TextEditingController(); // Initialize the length field
    breadth = TextEditingController(); // Initialize the breadth field

    tabController = TabController(length: 2, vsync: this);

    super.onInit();
  }

  Future<void> insertData(int totalHarga, String namaBarang) async {
    final waistValue = waist.text;
    final lengthValue = length.text;
    final breadthValue = breadth.text;
    final selectedColorValue = selectedColor.value;
    final quantityValue = quantity.value;

    Get.dialog(
      Theme(
        data: ThemeData(dialogBackgroundColor: Colors.pink),
        child: AlertDialog(
          title: const Text('Confirm Order',
              style: TextStyle(color: Colors.white)),
          content: const Text('Are you sure you want to place this order?',
              style: TextStyle(color: Colors.white)),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Get.back(result: false);
              },
            ),
            TextButton(
              child:
                  const Text('Confirm', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                Get.back(closeOverlays: true);

                await firestore.collection('tb_order').add({
                  'createdAt': FieldValue.serverTimestamp(),
                  'nama_barang': namaBarang,
                  'waist': waistValue,
                  'length': lengthValue,
                  'breadth': breadthValue,
                  'color': selectedColorValue,
                  'quantity': quantityValue,
                  'total_harga': totalHarga,
                }).then((value) {
                  Get.snackbar(
                      backgroundColor: Colors.pink,
                      colorText: Colors.white,
                      'Success',
                      'Item successfully added to cart');
                }).catchError((error) {
                  Get.snackbar('Error', 'Data gagal ditambahkan');
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onClose() {
    waist.dispose();
    length.dispose();
    breadth.dispose();
    tabController.dispose();

    super.onClose();
  }
}
