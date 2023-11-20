import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_compression/image_compression.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  Rxn<File> image = Rxn<File>();
  String? base64Image;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Compress the image file
      final bytes = await pickedFile.readAsBytes();
      final path = pickedFile.path;
      final input = ImageFile(
        rawBytes: bytes,
        filePath: path,
      );
      final output =
          await compressInQueue(ImageFileConfiguration(input: input));
      // Convert the compressed image to base64
      base64Image = base64Encode(output.rawBytes);

      // Update the image value with the file
      image.value = File(input.filePath);
    } else {
      Get.snackbar(
          backgroundColor: Colors.pink,
          colorText: Colors.white,
          'Error',
          'Tidak Gambar yang di pilih');
    }
  }

  Future<void> addItem() async {
    final namaBarang = titleController.text;
    final description = descriptionController.text;
    final price = int.parse(priceController.text);

    try {
      await firestore.collection('tb_barang').add({
        'nama_barang': namaBarang,
        'description': description,
        'price': price,
        'image': base64Image,
      });

      Get.snackbar(
        backgroundColor: Colors.pink,
        colorText: Colors.white,
        'Berhasil',
        'Data ditambahkan',
        snackbarStatus: (status) {
          titleController.clear();
          descriptionController.clear();
          priceController.clear();
          image.value = null;
        },
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
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
