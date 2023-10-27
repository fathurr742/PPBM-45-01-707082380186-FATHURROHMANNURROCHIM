import 'package:e_commerce/app/modules/detail_item/controllers/detail_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorDropdown extends GetView<DetailItemController> {
  @override
  final DetailItemController controller = Get.put(DetailItemController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: 120,
          child: DropdownButtonFormField<Color>(
            isExpanded: true,
            value: controller.selectedColor.value,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              filled: true,
              fillColor: Colors.grey[200],
              isDense: true,
              border: InputBorder.none,
            ),
            onChanged: (color) {
              controller.selectedColor.value = color!;
            },
            items: [
              DropdownMenuItem(
                value: Colors.red,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Red')
                  ],
                ),
              ),
              DropdownMenuItem(
                value: Colors.blue,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Blue')
                  ],
                ),
              ),
              DropdownMenuItem(
                value: Colors.green,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Green'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
