import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/barang_model.dart';

class HomepageController extends GetxController
    // ignore: deprecated_member_use
    with
        SingleGetTickerProviderMixin {
  final barang = <BarangModel>[].obs;
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;
  late TabController tabController;
  late PageController pageController;
  Timer? timer;

  GlobalKey bottomNavigationKey = GlobalKey();
  RxInt selectedIndex = 0.obs;

  Future<void> _fetchData() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '192.168.137.1',
      port: 3306,
      user: 'flutter',
      password: 'malammakan',
      db: 'latihan_flutter',
    ));

    try {
      final result = await conn.query("SELECT * FROM tb_barang");

      final hasilFetch = result.map((fetch) {
        final id = fetch['id'] as int;

        final namaBarang = fetch['nama_barang'] as String;
        final description = fetch['description'] as String;
        final price = fetch['price'] as int;
        final imageBlob = fetch['image'] as Blob;
        String imageBase64 = String.fromCharCodes(imageBlob.toBytes());

        return BarangModel(
            id: id,
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
    } finally {
      await conn.close();
    }
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

    timer = Timer.periodic(Duration(seconds: 30), (Timer t) => _fetchData());
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();
    timer?.cancel(); // Cancel the timer
    super.onClose();
  }
}
