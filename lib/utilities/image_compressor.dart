import 'package:file_selector/file_selector.dart';
import 'package:image/image.dart' as img;

class ImageCompressor {
  ImageCompressor({required this.files});

  List<XFile> files;

  List<String> getImageName() {
    List<String> imagesNameList = files.map((e) => e.name).toList();
    return imagesNameList;
  }

  compressImage(String width) async {
    for (int i = 0; i < files.length; i++) {
      String imagePath = files[i].path;
      String imageName = files[i].name;
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
