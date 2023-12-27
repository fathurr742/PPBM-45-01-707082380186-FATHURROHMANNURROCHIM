import 'dart:convert';

import 'package:e_commerce/app/modules/checkoutpage/controllers/checkoutpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget produktile(CheckoutpageController controller) {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
  bool isValidBase64(String base64String) {
    try {
      base64Decode(base64String);
      return true;
    } catch (error) {
      return false;
    }
  }

  return Obx(() => ListView.builder(
        shrinkWrap: true, // Add this line
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.items.length,
        itemBuilder: (context, int index) {
          final item = controller.items[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(10),
            height: 220,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ichlasul Amal Pangestu',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'BackEnd Developer',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text('Hapus Item'),
                              content: const Text(
                                  'Apakah anda yakin ingin menghapus item ini?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    controller.deleteItem(item.id!);
                                    Get.back();
                                  },
                                  child: const Text('Hapus'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('Batal'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 2,
                  thickness: 0.9,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: [
                            item.image64 is String &&
                                    isValidBase64(item.image64!)
                                ? Image.memory(
                                    width: 50,
                                    height: 100,
                                    base64Decode(item.image64!),
                                    fit: BoxFit.cover,
                                  )
                                : item.image64 is String
                                    ? Image.network(
                                        width: 50,
                                        height: 100,
                                        item.image64!,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(MdiIcons
                                        .pictureInPictureTopRightOutline),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.namaBarang!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.color!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text('W: ${item.waist!}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('L: ${item.length!}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('B: ${item.breadth!}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Obx(() => Text(
                                        formatCurrency.format(item.totalHarga! *
                                            item.quantity!.value),
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.pink,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            iconSize: 20,
                            icon: const Icon(Icons.remove),
                            onPressed: () => controller.decreaseQuantity(item),
                          ),
                          Obx(() =>
                              Text('${item.quantity!.value}')), // wrap with Obx
                          IconButton(
                            iconSize: 20,
                            icon: const Icon(Icons.add),
                            onPressed: () => controller.increaseQuantity(item),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ));
}
