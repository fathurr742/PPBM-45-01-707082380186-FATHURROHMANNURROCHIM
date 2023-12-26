import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
