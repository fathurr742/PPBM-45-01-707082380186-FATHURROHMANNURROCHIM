import 'package:e_commerce/app/modules/detail_item/controllers/detail_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorDropdown extends GetView<DetailItemController> {
  @override
  final DetailItemController controller = Get.put(DetailItemController());

  ColorDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: 120,
          child: DropdownButtonFormField<String>(
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
            items: const [
              DropdownMenuItem(
                value: 'Red',
                child: Text('Red'),
              ),
              DropdownMenuItem(
                value: 'Blue',
                child: Text('Blue'),
              ),
              DropdownMenuItem(
                value: 'Green',
                child: Text('Green'),
              ),
            ],
          ),
        ));
  }
}
