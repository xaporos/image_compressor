import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_compressor/controllers/get_images_controller.dart';
import 'package:image_compressor/utilities/image_compressor.dart';

class ResizeImagesButton extends StatelessWidget {
  const ResizeImagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final getImages = Get.put(GetImagesController());

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blueAccent, width: 0.3),
        // primary: Colors.blue,
        // onSurface: Colors.amber,
        textStyle: const TextStyle(
          fontFamily: "Orbitron",
          fontSize: 18,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 17,
        ),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
      onPressed: () {
        final images = getImages.images;
        ImageCompressor(images: images).compressImage('600');
      },
      child: const Text('Resize'),
    );
  }
}
