// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:e_commerce/app/data/checkout_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum PaymentMethod { Bank, E_Wallet, Merchant, Qris }

class CheckoutpageController extends GetxController {
  final items = <CheckoutModel>[].obs;
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;

  RxInt totalPembayaran = 0.obs;
  RxInt subTotal = 0.obs;

  RxInt quantity = RxInt(0);
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Timer? timer;
  var selectedMethod = Rx<PaymentMethod>(PaymentMethod.Bank);

  @override
  void onInit() {
    super.onInit();

    firestore
        .collection('tb_order')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      _fetchData(snapshot.docs);
    });
  }

  Future<void> _fetchData(List<QueryDocumentSnapshot> orderDocs) async {
    try {
      final newItems = <CheckoutModel>[]; // Create a new list

      for (var orderDoc in orderDocs) {
        final Map<String, dynamic>? orderData =
            orderDoc.data() as Map<String, dynamic>?;

        if (orderData != null) {
          final namaBarang = orderData['nama_barang'];

          final barangResult = await firestore
              .collection('tb_barang')
              .where('nama_barang', isEqualTo: namaBarang)
              .get();

          for (var barangDoc in barangResult.docs) {
            final Map<String, dynamic> barangData = barangDoc.data();

            final checkoutItem = CheckoutModel(
              namaBarang: barangData['nama_barang'],
              color: orderData['color'],
              quantity: orderData['quantity'],
              totalHarga: orderData['total_harga'],
              image64: barangData['image'],
              waist: orderData['waist'],
              length: orderData['length'],
              breadth: orderData['breadth'],
            );

            newItems.add(checkoutItem); // Add the item to the new list
          }
        }
      }

      items.assignAll(newItems); // Assign the new list to items
    } catch (error) {
      hasError.value = true;
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void increaseQuantity(CheckoutModel item) {
    item.quantity!.value++;
  }

  void decreaseQuantity(CheckoutModel item) {
    if (item.quantity!.value > 1) {
      item.quantity!.value--;
    }
  }

  void selectMethod(PaymentMethod method) {
    selectedMethod.value = method;
  }

  double calculatesubTotal() {
    double grandTotal = 0.0;

    for (var item in items) {
      grandTotal += item.totalHarga! * item.quantity!.value;
    }

    return grandTotal;
  }
}
