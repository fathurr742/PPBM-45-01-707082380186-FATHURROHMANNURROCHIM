import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String? profileImage, title, subtitle, description, image;
  CustomCard(
      {super.key,
      required this.profileImage,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: Image.asset(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          image!,
                          fit: BoxFit.cover,
                        ),
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
