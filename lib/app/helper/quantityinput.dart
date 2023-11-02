import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/app/modules/detail_item/controllers/detail_item_controller.dart';

class QuantityInput extends GetView<DetailItemController> {
  @override
  final DetailItemController controller = Get.put(DetailItemController());

  QuantityInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          IconButton(
            onPressed: () {
              controller.quantity.value = controller.quantity.value > 1
                  ? controller.quantity.value - 1
                  : 1;
            },
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              enabled: false,
              controller:
                  TextEditingController(text: '${controller.quantity.value}'),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                filled: true,
                fillColor: Colors.grey[200],
                isDense: true,
                border: InputBorder.none,
              ),
              onChanged: (value) {
                controller.quantity.value = int.tryParse(value) ?? 1;
              },
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              controller.quantity.value++;
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
