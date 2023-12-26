import 'package:e_commerce/app/modules/checkoutpage/controllers/checkoutpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget pembayaran(CheckoutpageController controller) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: Get.width,
    height: 272,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
      children: PaymentMethod.values.map((method) {
        return Column(
          children: [
            Obx(() => RadioListTile<PaymentMethod>(
                  title: Row(
                    children: [
                      Icon(
                        getIconForMethod(method), // get the icon for the method
                        color: Colors.black,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(method.toString().split('.').last,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                    ],
                  ),
                  value: method,
                  groupValue: controller.selectedMethod.value,
                  onChanged: (PaymentMethod? value) {
                    controller.selectMethod(value!);
                  },
                  controlAffinity: ListTileControlAffinity
                      .trailing, // aligns the radio button to the right
                )),
            const Divider(
              height: 2,
            ),
          ],
        );
      }).toList(),
    ),
  );
}

IconData getIconForMethod(PaymentMethod method) {
  switch (method) {
    case PaymentMethod.Bank:
      return MdiIcons.bankOutline;
    case PaymentMethod.E_Wallet:
      return MdiIcons.walletOutline;
    case PaymentMethod.Merchant:
      return MdiIcons.storeOutline;
    case PaymentMethod.Qris:
      return MdiIcons.qrcode;
    default:
      return MdiIcons.creditCardOutline;
  }
}
