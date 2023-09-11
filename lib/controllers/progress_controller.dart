import 'package:get/get.dart';

class ProgressController extends GetxController {
  Rx<double> progress = 0.0.obs;

  void updateProgress(int numImg, int numImages) {
    progress.value = ((numImg * 100) / numImages) * 0.01;
  }
}
