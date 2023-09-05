import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compressor/cubits/images_selector_cubit.dart';
import 'package:image_compressor/utilities/image_compressor.dart';

class ResizeImagesButton extends StatelessWidget {
  const ResizeImagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImagesSelectorCubit(),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blueAccent, width: 0.3),
          // primary: Colors.blue,
          // onSurface: Colors.amber,
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
          final selectedImages = context.read<ImagesSelectorCubit>().state;
          ImageCompressor(files: selectedImages).compressImage('600');
        },
        child: const Text('Resize'),
      ),
    );
  }
}
