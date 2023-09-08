import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_compressor/controllers/slider_controller.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final slider = Get.put(SliderController());

    return SizedBox(
      child: Obx(
        () => Slider(
          value: slider.range.value,
          min: 0,
          max: 100,
          divisions: 100,
          label: slider.range.round().toString(),
          onChanged: (double value) {
            slider.setRange(value);
          },
        ),
      ),
    );
  }
}
