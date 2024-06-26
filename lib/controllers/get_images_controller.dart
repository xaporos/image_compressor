import 'package:file_selector/file_selector.dart';
import 'package:get/get.dart';

class GetImagesController extends GetxController {
  RxList<XFile> images = <XFile>[].obs;

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

    images.value = files;
  }
}
