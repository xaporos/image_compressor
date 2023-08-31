import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
// import 'package:path/path.dart' as path;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<XFile>? _imageFileList;

  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  imageSelector() async {
    const XTypeGroup jpgsTypeGroup = XTypeGroup(
      label: 'JPEGs',
      extensions: <String>['jpg', 'jpeg'],
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
        _imageFileList = files;
      });
    }
  }

  imagesPathList() {
    String imagePath = _imageFileList!.map((e) => e.path).toString();

    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Resize'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _imageFileList != null ? Text('Name') : const Text('Pick Image'),
          const SizedBox(
            height: 20,
          ),
          _imageFileList != null
              ? Text(imagesPathList().toString())
              : const Text('Pick Image'),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          imageSelector();
        },
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: const Icon(Icons.add_a_photo_sharp),
      ),
    );
  }
}
