import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;

  Rxn<File> image = Rxn<File>();
  String? base64Image;
  final categories = ["women's clothing", "men's clothing", "accessory"].obs;
  final selectedCategory = "women's clothing".obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Compress the image
      final result = await FlutterImageCompress.compressWithFile(
        pickedFile.path,
        minWidth: 200,
        minHeight: 200,
        quality: 20,
      );

      // Convert the compressed image to base64
      base64Image = base64Encode(result!);

      // Update the image value with the compressed file
      image.value = File(pickedFile.path);
    } else {
      Get.snackbar(
        backgroundColor: Colors.pink,
        colorText: Colors.white,
        'Error',
        'Tidak Gambar yang di pilih',
      );
    }
  }

  Future<void> addItem() async {
    final namaBarang = titleController.text;
    final description = descriptionController.text;
    final price = int.parse(priceController.text);

    try {
      await firestore.collection('tb_barang').doc(namaBarang).set({
        'createdAt': FieldValue.serverTimestamp(),
        'nama_barang': namaBarang,
        'description': description,
        'price': price,
        'image': base64Image,
        'category': selectedCategory.value,
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
