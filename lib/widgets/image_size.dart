import 'package:flutter/material.dart';

class ImageSize extends StatefulWidget {
  const ImageSize({super.key});

  @override
  State<ImageSize> createState() => _ImageSizeState();
}

class _ImageSizeState extends State<ImageSize> {
  List<String> availableSizesList = ['Original', 'Small', 'Medium', 'Large'];
  String selectedSize = 'Original';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: availableSizesList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedSize = newValue!;
        });
      },
      value: selectedSize,
    );
  }
}
