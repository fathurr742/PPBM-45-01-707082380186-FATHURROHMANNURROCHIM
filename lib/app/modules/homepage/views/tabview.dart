import 'dart:convert';
import 'dart:typed_data';

import 'package:e_commerce/app/helper/custom_appbar.dart';
import 'package:e_commerce/app/helper/custom_card.dart';
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
                  text: 'CHILDREN',
                )
              ]),
        ),
        body: Obx(() => TabBarView(
              controller: controller.tabController,
              children: [
                controller.hasError.value
                    ? Center(
                        child: Text(controller.errorMessage.value),
                      )
                    : Obx(() => ListView.builder(
                          itemCount: controller.barang.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = controller.barang[index];

                            Uint8List? imageMemory = item.imageBase64 != null
                                ? base64Decode(item.imageBase64!)
                                : null;
                            return CustomCard(
                              profileImage: 'assets/ichlasul.png',
                              title: 'Ichlasul Amal Pangestu',
                              subtitle: 'Backend Developer',
                              description: item.description ?? 'No Description',
                              image: imageMemory ?? Uint8List(0),
                              dataBarang: item,
                            );
                          },
                        )),
                const Icon(Icons.directions_bike),
                const Icon(Icons.directions_bike),
              ],
            )));
  }
}
