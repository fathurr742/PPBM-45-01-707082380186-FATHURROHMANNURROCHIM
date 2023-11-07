import 'package:e_commerce/app/helper/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: CustomAppBar(
        heigh: 0,
        title: 'Checkout',
        actionbar: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    height: 500,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.credit_card),
                          title: const Text('Credit Card'),
                          onTap: () {
                            // Handle credit card payment here
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.payment),
                          title: const Text('Debit Card'),
                          onTap: () {
                            // Handle debit card payment here
                            Navigator.of(context).pop();
                          },
                        ),
                        // Add more payment methods here
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.hasError.value) {
          return Center(child: Text('Error: ${controller.errorMessage.value}'));
        } else {
          return ListView.separated(
            separatorBuilder: ((context, index) => const Divider(
                  height: 3,
                )),
            itemCount: controller.items.length,
            itemBuilder: (context, int index) {
              final item = controller.items[index];

              return Dismissible(
                key: Key(item.id.toString()),
                onDismissed: (_) {
                  controller.delete(item.id!);
                  controller.items.removeAt(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    tileColor: Colors.pink,
                    titleTextStyle: GoogleFonts.raleway(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    leadingAndTrailingTextStyle:
                        GoogleFonts.raleway(color: Colors.white),
                    title: Text(item.namaBarang!),
                    trailing: IconButton(
                      onPressed: () {
                        controller.delete(item.id!);
                        controller.items.removeAt(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.color} x ${item.quantity}',
                          style: GoogleFonts.raleway(color: Colors.white),
                        ),
                        Text(
                          formatCurrency.format(item.total_harga),
                          style: GoogleFonts.raleway(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
