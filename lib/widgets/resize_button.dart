import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_compressor/controllers/dropdown_controller.dart';
import 'package:image_compressor/controllers/get_images_controller.dart';
import 'package:image_compressor/controllers/slider_controller.dart';
import 'package:image_compressor/utilities/image_compressor.dart';
import 'package:image_compressor/widgets/quality_slider.dart';
import 'package:image_compressor/widgets/size_dropdown.dart';

class ResizeButton extends StatelessWidget {
  const ResizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final getImages = Get.put(GetImagesController());
    final getSliderValue = Get.put(SliderController());
    final getDropdownValue = Get.put(DropdownController());

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue, width: 1),
        textStyle: const TextStyle(
          fontFamily: "Orbitron",
          fontSize: 18,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 17,
        ),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: ((context) {
            return Container(
              height: 230,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Image Size:',
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: 'Orbitron'),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          SizeDropdown(),
                        ],
                      ),
                    ),
                    const Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Image Quality:',
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: 'Orbitron'),
                            ),
                          ),
                          QualitySlider(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Card(
                      color: Colors.grey[200],
                      elevation: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Apply',
                                textScaleFactor: 1.2,
                                style: TextStyle(fontFamily: 'Orbitron'),
                              ),
                            ),
                            onPressed: () {
                              final images = getImages.images;
                              Navigator.of(context).pop();
                              // Get.to(const MainPage());

                              ImageCompressor(images: images).compressImage(
                                  getSliderValue.range.value.toInt(),
                                  getDropdownValue.imageSize.value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
      child: const Text('Resize'),
    );
  }
}
