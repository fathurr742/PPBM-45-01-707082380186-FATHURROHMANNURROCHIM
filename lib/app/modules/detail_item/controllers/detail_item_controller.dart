import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailItemController extends GetxController
    with SingleGetTickerProviderMixin {
  final Rx<Color> selectedColor = Colors.red.obs;
  late TabController tabController;
  final RxInt quantity = 1.obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
