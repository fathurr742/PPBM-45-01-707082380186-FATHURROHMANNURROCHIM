import 'package:e_commerce/app/helper/customcard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  final HomepageController controller = Get.put(HomepageController());

  HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: TabBar(
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
        title: const Text(
          'Discovery',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            children: <Widget>[
              CustomCard(
                  profileImage: 'assets/ichlasul.png',
                  title: 'Ichlasul Amal Pangestu',
                  subtitle: 'Backend Developer',
                  description:
                      'Lorem Ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id rhoncus luctus, nisl quam aliquam nunc, vitae aliquam nisl nunc vitae nisl. Sed euismod, diam id rhoncus luctus, nisl quam aliquam nunc, vitae aliquam nisl nunc vitae nisl.',
                  image: 'assets/suit-ichlasul.jpg'),
            ],
          ),
          ListView(
            children: [
              CustomCard(
                  profileImage: 'assets/ichlasul.png',
                  title: 'Ichlasul Amal Pangestu',
                  subtitle: 'Backend Developer',
                  description:
                      'Lorem Ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id rhoncus luctus, nisl quam aliquam nunc, vitae aliquam nisl nunc vitae nisl. Sed euismod, diam id rhoncus luctus, nisl quam aliquam nunc, vitae aliquam nisl nunc vitae nisl.',
                  image: 'assets/suit-ichlasul.jpg'),
            ],
          ),
          const Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}
