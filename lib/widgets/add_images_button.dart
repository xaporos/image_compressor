import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compressor/cubits/images_selector_cubit.dart';

class AddImagesButton extends StatelessWidget {
  const AddImagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImagesSelectorCubit(),
      child: FloatingActionButton.small(
        onPressed: () {
          context.read<ImagesSelectorCubit>().selectImages();
        },
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: const Icon(Icons.add_a_photo_sharp),
      ),
    );
  }
}
