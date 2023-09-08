import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_compressor/controllers/dropdown_controller.dart';

class SizeDropdown extends StatelessWidget {
  const SizeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Get.put(DropdownController());

    return SizedBox(
      child: Obx(
        () => DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: DropdownButton(
            value: size.imageSize.value,
            underline: Container(),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            // dropdownColor: Colors.amber,
            // icon: const Icon(Icons.arrow_circle_down_sharp),
            onChanged: (newValue) {
              size.setImageSize(newValue.toString());
            },
            items: size.list.map<DropdownMenuItem<String>>((String size) {
              return DropdownMenuItem<String>(
                value: size,
                child: Text(
                  size,
                  style: const TextStyle(fontFamily: 'Orbitron'),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
