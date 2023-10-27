import 'package:e_commerce/app/modules/checkoutpage/views/checkoutpage_view.dart';
import 'package:e_commerce/app/modules/homepage/views/add_post.dart';
import 'package:e_commerce/app/modules/homepage/views/chart.dart';
import 'package:e_commerce/app/modules/homepage/views/tabview.dart';
import 'package:e_commerce/app/modules/homepage/views/setting.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  @override
  final HomepageController controller = Get.put(HomepageController());

  HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
            physics:
                const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            controller: controller.pageController,
            children: [
              MyTabView(),
              CheckoutpageView(),
              const MySettingPage(),
              const AddPage(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: 'Checkout',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add',
                ),
              ],
              currentIndex: controller.selectedIndex.value,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black,
              unselectedLabelStyle: GoogleFonts.raleway(color: Colors.black),
              selectedLabelStyle: GoogleFonts.raleway(color: Colors.red),
              onTap: controller.onItemTapped,
              showUnselectedLabels: true,
            )));
  }
}
