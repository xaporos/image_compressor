import 'package:image/image.dart' as img;

class ImageCompressor {
  ImageCompressor({required this.pathsList, required this.namesList});

  final List<String> pathsList;
  final List<String> namesList;

  compressImage(String width) async {
    for (int i = 0; i < pathsList.length; i++) {
      String imagePath = pathsList[i];
      String imageName = namesList[i];
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
