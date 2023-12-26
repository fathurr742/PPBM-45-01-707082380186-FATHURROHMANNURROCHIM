import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomModal extends StatelessWidget {
  final Widget child;

  const CustomModal({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: Get.width,
      child: child,
    );
  }
}
