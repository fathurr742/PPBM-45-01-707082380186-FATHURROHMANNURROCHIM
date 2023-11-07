import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:e_commerce/app/data/barang_model.dart';
import 'package:e_commerce/app/helper/colordropdown.dart';
import 'package:e_commerce/app/helper/customappbar.dart';
import 'package:e_commerce/app/helper/quantityinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_item_controller.dart';

class DetailItemView extends GetView<DetailItemController> {
  final BarangModel dataBarang;

  @override
  final DetailItemController controller = Get.put(DetailItemController());

  DetailItemView({super.key}) : dataBarang = Get.arguments as BarangModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        heigh: 0,
        title: '',
        actionbar: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.heart_broken_outlined, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_outlined, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        children: [imageSlider(), bottomBody(context)],
      ),
    );
  }

  Widget imageSlider() {
    Uint8List imageBytes = base64Decode(dataBarang.imageBase64!);
    return ImageSlideshow(
      width: double.infinity,
      height: 300,
      initialPage: 0,
      indicatorColor: Colors.pink,
      isLoop: true,
      indicatorBackgroundColor: Colors.grey,
      children: [
        Image.memory(
          imageBytes,
          fit: BoxFit.cover,
        ),
        Image.memory(
          imageBytes,
          fit: BoxFit.cover,
        ),
        Image.memory(
          imageBytes,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget bottomBody(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
    String price = formatCurrency.format(dataBarang.price);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataBarang.namaBarang!,
                style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                price,
                style: GoogleFonts.raleway(
                    color: Colors.pink, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        //TabView
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelStyle: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                labelColor: Colors.black,
                indicatorColor: Colors.red,
                controller: controller.tabController,
                tabs: const [
                  Tab(text: 'Description'),
                  Tab(text: 'Measurement'),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      description(),
                      measurements(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget description() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MATERIALS',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              dataBarang.description!,
              style: GoogleFonts.raleway(
                height: 1.5,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'WASH INSTURCTION',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sit amet ante erat. Maecenas vel tortor eu arcu consequat ultrices eget at mi. Nunc in purus neque. Nam consequat vitae nisl sed varius. Morbi ornare, nisi vitae tincidunt fringilla, lorem urna congue leo, non congue leo dui eget orci. Etiam sed scelerisque dolor. Ut eget faucibus nunc, a aliquet ligula. Cras pretium commodo nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque sit amet est metus. In sagittis blandit massa vitae eleifend. Curabitur lacinia interdum imperdiet. Sed quis tempus neque. Pellentesque ornare consectetur dui, et molestie elit. Sed efficitur odio et molestie blandit. Aenean nec purus pretium tortor sagittis faucibus.',
              style: GoogleFonts.raleway(
                height: 1.5,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget measurements() {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'WAIST',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: controller.waist,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        filled: true,
                        fillColor: Colors.grey[200],
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'LENGTH',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: controller.length,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        filled: true,
                        fillColor: Colors.grey[200],
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'BREADTH',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: controller.breadth,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        filled: true,
                        fillColor: Colors.grey[200],
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'COLOR',
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          ColorDropdown(),
          const SizedBox(height: 20),
          const Text(
            'Quantity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(width: 200, child: QuantityInput()),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.grey,
            thickness: 0.6,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Obx(() {
              int totalPrice =
                  controller.quantity.value * (dataBarang.price ?? 0);
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(230, 50),
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    controller.insertData(totalPrice, dataBarang.namaBarang!);
                  },
                  child: Text(
                    formatCurrency.format(totalPrice),
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ));
            }),
          )
        ],
      ),
    );
  }
}
