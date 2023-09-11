// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:image/image.dart' as img;
import 'package:image_compressor/controllers/progress_controller.dart';

class ImageCompressor {
  ImageCompressor({required this.images});
  final List<XFile> images;

  final getProgress = Get.put(ProgressController());

  showProgress() {
    EasyLoading.showProgress(getProgress.progress.value,
        status: 'Processing...');
  }

  compressImage(int quality, String size) async {
    double imageSizeFactor = 1;
    final int numImages = images.length;
    // EasyLoading.show(status: 'Processing...');

    print(images.length);

    switch (size) {
      case 'Original':
        imageSizeFactor = 1;
        break;
      case 'Small':
        imageSizeFactor = 0.25;
        break;
      case 'Medium':
        imageSizeFactor = 0.5;
        break;
      case 'Large':
        imageSizeFactor = 0.75;
        break;
    }

    for (int i = 0; i < images.length; i++) {
      int numImage = i + 1;
      getProgress.updateProgress(numImage, numImages);

      EasyLoading.showProgress(getProgress.progress.value,
          status: 'Resizing...');

      String imagePath = images[i].path;
      String imageName = images[i].name;
      String resizedFilePath =
          imagePath.replaceAll(imageName, '${imageName}_resized.jpg');

      final imageDecode = img.decodeJpg(File(images[i].path).readAsBytesSync());
      double imageSize = imageDecode!.height * imageSizeFactor;

      final cmd = img.Command()
        ..decodeImageFile(imagePath)
        ..copyResize(
            height: imageSize.toInt(), interpolation: img.Interpolation.nearest)
        ..encodeJpg(quality: quality)
        ..writeToFile(resizedFilePath);

      await cmd.executeThread();
    }
    EasyLoading.showSuccess('Done!');
  }
}
