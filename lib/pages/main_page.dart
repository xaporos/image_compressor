import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_compressor/controllers/get_images_controller.dart';
import 'package:image_compressor/widgets/add_images_button.dart';
import 'package:image_compressor/widgets/list_of_images.dart';
import 'package:image_compressor/widgets/resize_images_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getImages = Get.put(GetImagesController());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => getImages.images.isNotEmpty
                ? ListOfImages(
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => getImages.images.isNotEmpty
                ? const ResizeImagesButton()
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
