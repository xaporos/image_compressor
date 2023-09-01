import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_compressor/pages/home.dart';
import 'package:image/image.dart' as img;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<XFile> imageFileList = [];

  imageSelector() async {
    const XTypeGroup jpgsTypeGroup = XTypeGroup(
      label: 'JPEGs',
      extensions: <String>['jpg', 'JPG', 'jpeg'],
    );
    const XTypeGroup pngTypeGroup = XTypeGroup(
      label: 'PNGs',
      extensions: <String>['png'],
    );
    final List<XFile> files = await openFiles(acceptedTypeGroups: <XTypeGroup>[
      jpgsTypeGroup,
      pngTypeGroup,
    ]);

    if (files.isEmpty) {
      // Operation was canceled by the user.
      return;
    } else {
      setState(() {
        imageFileList = files;
      });
    }
  }

  List<String> imagesPath() {
    if (imageFileList.isNotEmpty) {
      List<String> imagePath = imageFileList.map((e) => e.path).toList();

      return imagePath;
    } else {
      return ['Images - Path'];
    }
  }

  List<String> imagesName() {
    if (imageFileList.isNotEmpty) {
      List<String> imageName = imageFileList.map((e) => e.name).toList();

      return imageName;
    } else {
      return ['Images - Name'];
    }
  }

  compressImage() async {
    String imagePath = imageFileList[0].path;
    String imageName = imageFileList[0].name;
    String resizedFilePath =
        imagePath.replaceAll(imageName, '${imageName}_resized.jpg');

    final cmd = img.Command()
      ..decodeImageFile(imagePath)
      ..encodeJpg(quality: 25)
      ..writeToFile(resizedFilePath);

    await cmd.executeThread();
  }

  @override
  Widget build(BuildContext context) {
    return Home(
      imageSelector: imageSelector,
      imagesName: imagesName(),
      imagesPath: imagesPath(),
    );
  }
}
