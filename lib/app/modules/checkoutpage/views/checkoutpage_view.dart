import 'dart:convert';
import 'dart:typed_data';

import 'package:e_commerce/app/helper/custom_appbar.dart';
import 'package:e_commerce/app/helper/quantityinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/checkoutpage_controller.dart';

class CheckoutpageView extends GetView<CheckoutpageController> {
  @override
  final CheckoutpageController controller = Get.put(CheckoutpageController());

  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');

  CheckoutpageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          heigh: 0,
          title: 'Checkout',
          bgcolor: Colors.pink,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.2,
                width: Get.width,
                color: Colors.pink,
              ),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [body()],
              ),
            ],
          ),
        ));
  }

  Widget body() {
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
        SizedBox(
            width: Get.width, height: Get.height * 0.5, child: produktile()),
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
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ],
        ),
        pembayaran(),
      ],
    );
  }

  Widget alamat() {
    return Container(
      width: Get.width,
      height: 190,
      padding: const EdgeInsets.all(15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ragna Crimson',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '+6281234567890',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                height: 30,
                width: 60,
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Rumah',
                    style:
                        GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 2,
            thickness: 0.9,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Jl. Raya Bogor KM 30, Kp. Cijantung, Kec. Cimanggis, Kota Depok, Jawa Barat 16413',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CustomPaint(
            size: const Size(272, 2),
            painter: DashedLinePainter(),
          ),
        ],
      ),
    );
  }

  Widget produktile() {
    return Obx(() => ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, int index) {
            final item = controller.items[index];
            Uint8List bytes = base64.decode(item.image64!);
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              height: 190,
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
                          onPressed: () {}, icon: const Icon(Icons.close))
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(bytes),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item.namaBarang!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
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
                                          fontSize: 12,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text('L: ${item.length!}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text('B: ${item.breadth!}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.pink,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => controller.decreaseQuantity(item),
                          ),
                          Obx(() =>
                              Text('${item.quantity!.value}')), // wrap with Obx
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => controller.increaseQuantity(item),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }

  Widget pembayaran() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
                          getIconForMethod(
                              method), // get the icon for the method
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(
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
              Divider(
                height: 2,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 34, dashSpace = 6, startX = 0;
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    final max = size.width;
    final secondPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3;
    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      canvas.drawLine(Offset(startX + dashWidth + dashSpace, 0),
          Offset(startX + 2 * dashWidth + dashSpace, 0), secondPaint);
      startX += 2 * dashWidth + 2 * dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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
