import 'package:e_commerce/app/helper/custom_intro.dart';
import 'package:e_commerce/app/modules/homepage/views/homepage_view.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:get/get.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionSlider(
      next: Next(
          child: const Icon(Icons.arrow_forward_ios),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red))),
      back: Back(
          child: const Icon(Icons.arrow_back_ios),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red))),
      done: Done(
          child: const Icon(Icons.shopping_cart_checkout),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red)),
          home: HomepageView()),
      items: [
        customItemIntro('1', 'assets/intro1.jpg', 'Jennifer Kingsley',
            ' exploring the new range of winter fashion wear'),
        customItemIntro('2', 'assets/intro2.jpg', 'Jimmy Chuka',
            ' exploring new spring sweater collection'),
        customItemIntro('3', 'assets/intro3.jpg', 'Christian Lobi',
            ' showing us his new summer beach wears'),
      ],
      dotIndicator: const DotIndicator(
          unselectedColor: Colors.white, selectedColor: Colors.red),
    ));
  }
}
