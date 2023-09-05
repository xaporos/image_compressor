import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compressor/cubits/images_selector_cubit.dart';
import 'package:image_compressor/utilities/image_compressor.dart';
import 'package:image_compressor/widgets/add_images_button.dart';
import 'package:image_compressor/widgets/list_of_images.dart';
import 'package:image_compressor/widgets/resize_images_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedImages = context.watch<ImagesSelectorCubit>().state;
    final imagesNameList =
        ImageCompressor(files: selectedImages).getImageName();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          selectedImages.isNotEmpty
              ? ListOfImages(imagesNameList: imagesNameList)
              : const Image(
                  image: AssetImage('lib/assets/images/everest.png'),
                ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          selectedImages.isNotEmpty
              ? const ResizeImagesButton()
              : const SizedBox(),
          const SizedBox(
            width: 10,
          ),
          const AddImagesButton(),
        ],
      ),
    );
  }
}
