// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart';

import '../../../data/barang_model.dart';

class HomepageController extends GetxController
    with SingleGetTickerProviderMixin {
  final barang = <BarangModel>[].obs;
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;
  late TabController tabController;
  late PageController pageController;

  GlobalKey bottomNavigationKey = GlobalKey();
  RxInt selectedIndex = 0.obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _fetchData() {
    firestore
        .collection('tb_barang')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      try {
        final hasilFetch = snapshot.docs.map((doc) {
          final data = doc.data();

          final namaBarang = data['nama_barang'] != null
              ? data['nama_barang'] as String
              : null;
          final description = data['description'] != null
              ? data['description'] as String
              : null;
          final price = data['price'] != null ? data['price'] as int : null;
          final imageBase64 =
              data['image'] != null ? data['image'] as String : null;

          return BarangModel(
              imageBase64: imageBase64,
              namaBarang: namaBarang,
              description: description,
              price: price);
        }).toList();

        barang.assignAll(hasilFetch);
        isLoading.value = false;
      } catch (e) {
        hasError.value = true;
        errorMessage.value = e.toString();
      }
    });
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);

    update();
  }

  Future<bool> checkPermissionAndFileExistence(String imagePath) async {
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      // Storage permission granted, check if the file exists
      File imageFile = File(imagePath);
      bool fileExists = await imageFile.exists();
      return fileExists;
    } else {
      // Storage permission not granted
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _fetchData();
    tabController = TabController(length: 3, vsync: this);
    pageController = PageController();
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();

    super.onClose();
  }
}
