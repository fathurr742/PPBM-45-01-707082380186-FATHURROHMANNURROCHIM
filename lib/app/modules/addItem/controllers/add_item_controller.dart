import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysql1/mysql1.dart';

class AddItemController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  Rxn<File> image = Rxn<File>();

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> addItem() async {
    final nama_barang = titleController.text;
    final description = descriptionController.text;
    final price = priceController.text;
    final imageValue = image.value;

    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '192.168.137.1',
      port: 3306,
      user: 'flutter',
      password: 'malammakan',
      db: 'latihan_flutter',
    ));

    try {
      final result = await conn.query(
        'INSERT INTO tb_barang (nama_barang, description, price, image) VALUES (?, ?, ?, ?)',
        [
          nama_barang,
          description,
          price,
          imageValue.toString(),
        ],
      );

      if (result.affectedRows == 1) {
        Get.snackbar('Berhasil', 'Data ditambahkan');
      } else {
        Get.snackbar('Error', 'Data gagal ditambahkan');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      conn.close();
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.onClose();
  }
}
