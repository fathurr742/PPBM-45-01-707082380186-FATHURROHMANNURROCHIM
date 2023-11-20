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
  RxInt quantity = RxInt(0);
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Timer? timer;
  var selectedMethod = Rx<PaymentMethod>(PaymentMethod.Bank);

  @override
  void onInit() {
    super.onInit();

    firestore.collection('tb_order').snapshots().listen((snapshot) {
      _fetchData(snapshot.docs);
    });
  }

  Future<void> _fetchData(List<QueryDocumentSnapshot> orderDocs) async {
    try {
      items.clear(); // clear the items list

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
            final Map<String, dynamic>? barangData =
                barangDoc.data() as Map<String, dynamic>?;

            if (barangData != null) {
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

              items.add(checkoutItem);
            }
          }
        }
      }
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
}
