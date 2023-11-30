import 'package:e_commerce/app/data/barang_model.dart';
import 'package:e_commerce/app/helper/custom_appbar.dart';
import 'package:e_commerce/app/helper/custom_card.dart';
import 'package:e_commerce/app/helper/customcard_skeleton.dart';
import 'package:e_commerce/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabView extends GetView<HomepageController> {
  @override
  final HomepageController controller = Get.put(HomepageController());

  MyTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          heigh: 48,
          title: 'Discovery',
          textcolor: Colors.black,
          actionbar: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
            ),
          ],
          tabBar: TabBar(
              indicatorColor: Colors.red,
              labelColor: Colors.black,
              controller: controller.tabController,
              tabs: const [
                Tab(
                  text: 'WOMEN',
                ),
                Tab(
                  text: 'MEN',
                ),
                Tab(
                  text: 'ACCESSORY',
                )
              ]),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            _buildListView(
              controller.womenBarang,
              'assets/buGiva.jpg',
              'Giva Andriana Mutiara',
              'Dosen Telkom University',
            ),
            _buildListView(
              controller.menBarang,
              'assets/ichlasul.png',
              'Ichlasul Amal Pangestu',
              'Dragon Layer',
            ),
            _buildListView(
              controller.accessoryBarang,
              'assets/bauz.jpg',
              'Bauz Dinanta',
              'True Genius',
            ),
          ],
        ));
  }

  Widget _buildListView(
    RxList<BarangModel> barangList,
    String profilImage,
    String title,
    String subtitle,
  ) {
    return Obx(() {
      if (controller.isLoading.value) {
        // Show the skeleton card while loading
        return const CustomCardSkeleton();
      } else if (controller.hasError.value) {
        return Center(
          child: Text(controller.errorMessage.value),
        );
      } else {
        return ListView.builder(
          itemCount: barangList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = barangList[index];

            return CustomCard(
              profileImage: profilImage,
              title: title,
              subtitle: subtitle,
              description: item.description,
              image: item.image,
              dataBarang: item,
            );
          },
        );
      }
    });
  }
}
