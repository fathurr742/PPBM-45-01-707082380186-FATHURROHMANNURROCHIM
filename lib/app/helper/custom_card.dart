import 'dart:convert';

import 'package:e_commerce/app/data/barang_model.dart';
import 'package:e_commerce/app/modules/detail_item/views/detail_item_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String? profileImage, title, subtitle, description;
  dynamic image;
  final BarangModel dataBarang;

  bool isValidBase64(String base64String) {
    try {
      base64Decode(base64String);
      return true;
    } on FormatException {
      return false;
    }
  }

  CustomCard(
      {super.key,
      required this.profileImage,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.image,
      required this.dataBarang});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailItemView(), arguments: dataBarang);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 2,
                  offset: const Offset(1, 1))
            ]),
        height: 400,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(profileImage!),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            subtitle!,
                            style: GoogleFonts.aBeeZee(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.heart_broken,
                            color: Colors.red,
                          )),
                      Text(
                        '99K',
                        style: GoogleFonts.aBeeZee(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(description!,
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: image is String && isValidBase64(image)
                            ? Image.memory(
                                base64Decode(image),
                                fit: BoxFit.cover,
                              )
                            : image is String && image.isNotEmpty
                                ? Image.network(
                                    image,
                                    fit: BoxFit.cover,
                                  )
                                : Container(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              minimumSize: const Size(60, 25)),
                          onPressed: () {},
                          child: Text('#SUIT',
                              style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              minimumSize: const Size(60, 25)),
                          onPressed: () {},
                          child: Text('#MEN',
                              style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            color: Colors.grey,
                            size: 18,
                          )),
                      Text(
                        '100K',
                        style: GoogleFonts.raleway(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
