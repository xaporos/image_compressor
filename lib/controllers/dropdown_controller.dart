import 'package:get/get.dart';

class DropdownController extends GetxController {
  RxString imageSize = 'Original'.obs;
  List<String> list = ['Original', 'Small', 'Medium', 'Large'];

  void setImageSize(String imageSize) {
    this.imageSize.value = imageSize;
  }
}
