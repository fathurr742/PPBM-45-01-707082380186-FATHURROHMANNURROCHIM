import 'package:e_commerce/app/helper/custom_appbar.dart';
import 'package:e_commerce/app/modules/checkoutpage/component/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                children: [body(context, controller)],
              ),
            ],
          ),
        ));
  }
}
