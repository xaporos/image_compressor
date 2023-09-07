import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_compressor/controllers/get_images_controller.dart';
import 'package:image_compressor/utilities/image_compressor.dart';
import 'package:image_compressor/widgets/add_images_button.dart';
import 'package:image_compressor/widgets/list_of_images.dart';
import 'package:image_compressor/widgets/resize_images_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getImages = Get.put(GetImagesController());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => getImages.imageNameList.isNotEmpty
                ? ListOfImages(imageNameList: getImages.imageNameList)
                : const Image(
                    image: AssetImage('lib/assets/images/everest.png'),
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
            () => getImages.imagePathList.isNotEmpty
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
