import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController
    // ignore: deprecated_member_use
    with
        SingleGetTickerProviderMixin {
  late TabController tabController;
  late PageController pageController;

  GlobalKey bottomNavigationKey = GlobalKey();
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);

    update();
  }

  @override
  void onInit() {
    super.onInit();
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
