import 'package:e_commerce/app/helper/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/checkoutpage_controller.dart';

class CheckoutpageView extends GetView<CheckoutpageController> {
  @override
  final CheckoutpageController controller = Get.put(CheckoutpageController());

  CheckoutpageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        heigh: 0,
        title: 'Checkout',
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.hasError.value) {
          return Center(child: Text('Error: ${controller.errorMessage.value}'));
        } else {
          return ListView.separated(
            separatorBuilder: ((context, index) => const Divider()),
            itemCount: controller.items.length,
            itemBuilder: (context, int index) {
              final item = controller.items[index];
              final harga = item.quantity * 1000000;
              return Dismissible(
                key: Key(item.id.toString()),
                onDismissed: (_) {
                  controller.delete(item.id!);
                  controller.items.removeAt(index);
                },
                child: ListTile(
                  title: Text(item.namaBarang),
                  trailing: Text('Rp. $harga'),
                  subtitle: Text('${item.color} x ${item.quantity}'),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
