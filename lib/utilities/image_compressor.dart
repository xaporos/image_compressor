import 'package:file_selector/file_selector.dart';
import 'package:image/image.dart' as img;

class ImageCompressor {
  ImageCompressor({required this.images});

  final List<XFile> images;

  compressImage(String width) async {
    for (int i = 0; i < images.length; i++) {
      String imagePath = images[i].path;
      String imageName = images[i].name;
      String resizedFilePath =
          imagePath.replaceAll(imageName, '${imageName}_resized.jpg');

      final cmd = img.Command()
        ..decodeImageFile(imagePath)
        ..encodeJpg(quality: 25)
        ..copyResize(
            width: int.parse(width), interpolation: img.Interpolation.nearest)
        ..writeToFile(resizedFilePath);

      await cmd.executeThread();
    }
  }
}
