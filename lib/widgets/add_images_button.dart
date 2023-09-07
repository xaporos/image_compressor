import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_compressor/controllers/get_images_controller.dart';

class AddImagesButton extends StatelessWidget {
  const AddImagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final getImages = Get.put(GetImagesController());

    return FloatingActionButton.small(
      onPressed: () {
        getImages.selectImages();
      },
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: const Icon(Icons.add_a_photo_sharp),
    );
  }
}
