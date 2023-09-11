import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_compressor/controllers/get_images_controller.dart';
import 'package:image_compressor/widgets/add_images_button.dart';
import 'package:image_compressor/widgets/images_list_view.dart';
import 'package:image_compressor/widgets/resize_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getImages = Get.put(GetImagesController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, 0.0),
            radius: 1.2,
            colors: [
              Color.fromARGB(255, 232, 232, 232),
              Color.fromARGB(255, 191, 191, 191),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => getImages.images.isNotEmpty
                  ? ImagesListView(
                      images: getImages.images,
                    )
                  : const Image(
                      image: AssetImage('lib/assets/images/logo.png'),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => getImages.images.isNotEmpty
                ? const ResizeButton()
                : const SizedBox(),
          ),
          const SizedBox(
            width: 10,
          ),
          const AddImagesButton(),
        ],
      ),
    );
  }
}
