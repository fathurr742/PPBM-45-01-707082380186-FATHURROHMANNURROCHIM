import 'package:e_commerce/app/helper/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/add_item_controller.dart';

class AddItemView extends GetView<AddItemController> {
  @override
  final AddItemController controller = Get.put(AddItemController());

  AddItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(heigh: 0, title: 'Add Item'),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pink,
                Colors.pink.shade400,
                Colors.yellow,
              ],
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 130, // Add this line
                  width: 130, // Add this line
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: controller.image.value != null
                        ? DecorationImage(
                            image: FileImage(controller.image.value!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: controller.image.value == null
                      ? Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                          ),
                        )
                      : Container(), // Add this line
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]),
                  child: Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: controller.titleController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a title';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Title',
                              helperStyle: GoogleFonts.raleway(),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: controller.descriptionController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Description',
                              helperStyle: GoogleFonts.raleway(),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: controller.priceController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null ||
                                  int.tryParse(value) == null) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Price',
                              helperStyle: GoogleFonts.raleway(),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow.shade600,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                controller.pickImage();
                              },
                              child: const Text('Upload Image')),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                minimumSize: const Size(300, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return FutureBuilder(
                                        future: controller.addItem(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const AlertDialog(
                                              content: Row(
                                                children: [
                                                  CircularProgressIndicator(),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child:
                                                        Text('Adding item...'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            Navigator.of(context).pop();
                                            return const SizedBox.shrink();
                                          }
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                              child: const Text('Add Item')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
