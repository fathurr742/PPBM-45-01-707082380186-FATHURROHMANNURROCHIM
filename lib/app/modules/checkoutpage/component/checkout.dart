import 'package:e_commerce/app/modules/checkoutpage/controllers/checkoutpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget checkout(CheckoutpageController controller) {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

  int biayaPelayanan = 1000;
  int ongkir = 10000;

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 15),
    width: Get.width,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ]),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal Harga untuk Produk',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Obx(() => Text(
                        formatCurrency.format(controller.calculatesubTotal()),
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ongkos Kirim',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    formatCurrency.format(ongkir),
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Biaya Pelayanan',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    formatCurrency.format(biayaPelayanan),
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          height: 2,
        ),
        Container(
          height: 64,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.pink,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pembayaran',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Obx(() => Text(
                    formatCurrency.format(controller.calculatesubTotal() +
                        ongkir +
                        biayaPelayanan),
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
