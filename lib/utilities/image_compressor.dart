import 'package:file_selector/file_selector.dart';
import 'package:image/image.dart' as img;

class ImageCompressor {
  ImageCompressor({required this.files});

  List<XFile> files;

  List<String> getImageName() {
    List<String> imagesNameList = files.map((e) => e.name).toList();
    return imagesNameList;
  }

  // List<String> getImagePath() {
  //   List<String> imagesPathList = files.map((e) => e.path).toList();
  //   return imagesPathList;
  // }

  compressImage() async {
    for (int i = 0; i < files.length; i++) {
      String imagePath = files[i].path;
      String imageName = files[i].name;
      String resizedFilePath =
          imagePath.replaceAll(imageName, '${imageName}_resized.jpg');

      final cmd = img.Command()
        ..decodeImageFile(imagePath)
        ..encodeJpg(quality: 25)
        ..writeToFile(resizedFilePath);

      await cmd.executeThread();
    }
  }
}
