import 'package:file_selector/file_selector.dart';
import 'package:get/get.dart';

class GetImagesController extends GetxController {
  RxList<String> imageNameList = <String>[].obs;
  RxList<String> imagePathList = <String>[].obs;

  selectImages() async {
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

    final nameList = files.map((e) => e.name).toList();
    final pathList = files.map((e) => e.path).toList();
    imageNameList.value = nameList;
    imagePathList.value = pathList;
  }
}
