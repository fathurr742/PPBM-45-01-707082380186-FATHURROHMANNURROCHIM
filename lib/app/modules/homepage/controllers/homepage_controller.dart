// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/barang_model.dart';

class HomepageController extends GetxController
    with SingleGetTickerProviderMixin {
  final menBarang = <BarangModel>[].obs;
  final womenBarang = <BarangModel>[].obs;
  final accessoryBarang = <BarangModel>[].obs;
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;
  late TabController tabController;
  late PageController pageController;

  GlobalKey bottomNavigationKey = GlobalKey();
  RxInt selectedIndex = 0.obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _fetchApiData(
      String category, RxList<BarangModel> barangList) async {
    final dio = Dio();
    final response =
        await dio.get('https://fakestoreapi.com/products/category/$category');

    final apiData = await Future.wait((response.data as List).map((item) async {
      // Fetch the image data from the URL using Dio
      final responseImage = await dio.get(item['image'],
          options: Options(responseType: ResponseType.bytes));
      final imageData = responseImage.data;

      // Compress the image data
      final compressedImageData = await FlutterImageCompress.compressWithList(
        imageData,
        minWidth: 500,
        minHeight: 300,
        quality: 50,
      );

      // Convert the compressed image data to a base64 string
      final imageBase64 = base64Encode(compressedImageData);

      return BarangModel(
        image: imageBase64,
        namaBarang: item['title'],
        description: item['description'],
        price: item['price'].toInt(),
        category: item['category'],
      );
    }).toList());

    for (var item in apiData) {
      var namaBarang = item.namaBarang;

      // Check if the document exists in Firestore
      var docSnapshot =
          await firestore.collection('tb_barang').doc(namaBarang).get();

      if (!docSnapshot.exists) {
        // If the document doesn't exist, add it to Firestore
        await firestore.collection('tb_barang').doc(namaBarang).set({
          'nama_barang': item.namaBarang,
          'description': item.description,
          'price': item.price,
          'image': item.image,
          'category': item.category,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    }
  }

  late StreamSubscription<QuerySnapshot> _subscription;

  void _fetchData() {
    isLoading.value = true; // Set isLoading to true at the start

    _subscription = firestore
        .collection('tb_barang')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) async {
      final firestoreData = await Future.wait(snapshot.docs.map((doc) async {
        final data = doc.data();
        final documentId = doc.id;
        final namaBarang =
            data['nama_barang'] != null ? data['nama_barang'] as String : null;
        final description =
            data['description'] != null ? data['description'] as String : null;
        final price = data['price'] != null ? data['price'] as int : null;
        final imageBase64 =
            data['image'] != null ? data['image'] as String : null;
        final category =
            data['category'] != null ? data['category'] as String : null;

        // Fetch the rating from Firestore
        final ratingDoc =
            await firestore.collection('ratings').doc(documentId).get();
        final rating =
            ratingDoc.exists ? ratingDoc.data()!['rating'] as double : null;

        return BarangModel(
            documentId: documentId,
            image: imageBase64,
            namaBarang: namaBarang,
            description: description,
            price: price,
            category: category,
            rating: rating);
      }).toList());

      menBarang.assignAll(
          firestoreData.where((item) => item.category == "men's clothing"));
      womenBarang.assignAll(
          firestoreData.where((item) => item.category == "women's clothing"));
      accessoryBarang.assignAll(
          firestoreData.where((item) => item.category == "jewelery"));

      isLoading.value =
          false; // Set isLoading to false once the data has been fetched
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
    _fetchApiData("men's clothing", menBarang);
    _fetchApiData("women's clothing", womenBarang);
    _fetchApiData("jewelery", accessoryBarang);
    _fetchData();
    tabController = TabController(length: 3, vsync: this);
    pageController = PageController();
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();
    _subscription
        .cancel(); // Cancel the subscription when it's no longer needed

    super.onClose();
  }
}
