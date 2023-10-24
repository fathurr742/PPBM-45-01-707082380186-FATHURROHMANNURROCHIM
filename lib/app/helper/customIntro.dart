import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:google_fonts/google_fonts.dart';

IntroductionSliderItem customItemIntro(
    String index, String image, String title, String subtitle) {
  return IntroductionSliderItem(
    logo: Image.asset(
      'assets/Vector.png',
      scale: 2,
    ),
    title: Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'NO',
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                index,
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Featured',
            style: GoogleFonts.raleway(
                color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Tailored',
            style: GoogleFonts.raleway(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    subtitle: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.raleway(
                fontSize: 16.0,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24)),
                TextSpan(
                  text: subtitle,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(300, 60),
              side: const BorderSide(width: 2.0, color: Colors.white),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
            onPressed: () {},
            child: Text(
              'Shop Now',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ))
      ],
    ),
    backgroundImageDecoration:
        BackgroundImageDecoration(image: AssetImage(image), fit: BoxFit.cover),
  );
}
