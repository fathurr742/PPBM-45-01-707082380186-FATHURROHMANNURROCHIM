import 'dart:convert';
import 'dart:io';
import 'package:mysql1/mysql1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  Rxn<File> image = Rxn<File>();
  String? base64Image;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      base64Image = base64Encode(await image.value!.readAsBytes());
    } else {
      print('No image selected.');
    }
  }

  Future<void> addItem() async {
    final namaBarang = titleController.text;
    final description = descriptionController.text;
    final price = priceController.text;

    final conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '192.168.137.1',
        port: 3306,
        user: 'flutter',
        password: 'malammakan',
        db: 'latihan_flutter',
      ),
    );

    try {
      final result = await conn.query(
        'INSERT INTO tb_barang (nama_barang, description, price, image) VALUES (?, ?, ?, ?)',
        [
          namaBarang,
          description,
          price,
          base64Image,
        ],
      );

      if (result.affectedRows != 0) {
        Get.snackbar(
            backgroundColor: Colors.pink,
            colorText: Colors.white,
            'Berhasil',
            'Data ditambahkan');
      } else {
        Get.snackbar('Error', 'Data gagal ditambahkan');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      await conn.close();
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
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.onClose();
  }
}
