import 'package:e_commerce/app/helper/custom_bank_tile.dart';
import 'package:e_commerce/app/helper/custom_modal.dart';
import 'package:e_commerce/app/modules/checkoutpage/component/alamat.dart';
import 'package:e_commerce/app/modules/checkoutpage/component/checkout.dart';
import 'package:e_commerce/app/modules/checkoutpage/component/pembayaran.dart';
import 'package:e_commerce/app/modules/checkoutpage/component/produktile.dart';
import 'package:e_commerce/app/modules/checkoutpage/controllers/checkoutpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget body(BuildContext context, CheckoutpageController controller) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Alamat Pengiriman',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Ubah Alamat',
              style: GoogleFonts.poppins(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      alamat(),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(MdiIcons.packageVariantClosed,
                  color: Colors.black, size: 18),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Produk',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
      produktile(controller),
      const SizedBox(
        height: 20,
      ),
      Row(
        children: <Widget>[
          Icon(MdiIcons.walletOutline, color: Colors.black, size: 18),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Metode Pembayaran',
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
      pembayaran(controller),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: <Widget>[
          Icon(MdiIcons.shopping, color: Colors.black, size: 18),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Rincian Pembayaran',
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
      checkout(controller),
      Container(
        width: Get.width,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                switch (controller.selectedMethod.value) {
                  case PaymentMethod.Qris:
                    return CustomModal(
                      child: Column(
                        children: [
                          Text(
                            'Pembayaran QRIS',
                            style: GoogleFonts.poppins(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Image.asset('assets/barcode.png')
                        ],
                      ),
                    );
                  case PaymentMethod.Bank:
                    return CustomModal(
                        child: Column(
                      children: [
                        Text(
                          'Pembayaran BANK',
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Custom_tile_card('assets/bca.png', "1234567890"),
                            const SizedBox(height: 10),
                            Custom_tile_card(
                                'assets/mandiri.png', "1234567890"),
                            const SizedBox(height: 10),
                            Custom_tile_card(
                                'assets/bank-jago.png', "1234567890"),
                          ],
                        ),
                      ],
                    ));
                  case PaymentMethod.E_Wallet:
                    return CustomModal(
                        child: Column(
                      children: [
                        Text(
                          'Pembayaran E-Wallet',
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Custom_tile_card('assets/gojek.png', "1234567890"),
                            const SizedBox(height: 10),
                            Custom_tile_card('assets/dana.png', "1234567890"),
                            const SizedBox(height: 10),
                            Custom_tile_card(
                                'assets/paytren.png', "1234567890"),
                          ],
                        ),
                      ],
                    ));
                  case PaymentMethod.Merchant:
                    return CustomModal(
                        child: Column(
                      children: [
                        Text(
                          'Pembayaran Merchant',
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Custom_tile_card(
                                'assets/indomaret.png', "1234567890"),
                            const SizedBox(height: 10),
                            Custom_tile_card(
                                'assets/alfamart.png', "1234567890"),
                            const SizedBox(height: 10),
                            Custom_tile_card('assets/lawson.jpg', "1234567890"),
                          ],
                        ),
                      ],
                    ));
                  default:
                    return const Center(child: Text('Pilih Metode Pembayaran'));
                }
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'Bayar Sekarang',
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
