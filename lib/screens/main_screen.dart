import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compressor/blocs/images_selector_cubit.dart';
import 'package:image_compressor/utilities/image_compressor.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ImagesSelectorCubit, List<XFile>>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ImageCompressor(files: state).compressImage();
                  },
                  child: const Text('Resize'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              state.isNotEmpty
                  ? Text('${ImageCompressor(files: state).getImageName()}')
                  : const Text('Select Images'),
            ],
          );
        },
      ),
      floatingActionButton: BlocBuilder<ImagesSelectorCubit, List<XFile>>(
        builder: (context, state) {
          return FloatingActionButton.small(
            onPressed: () {
              context.read<ImagesSelectorCubit>().selectImages();
            },
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: const Icon(Icons.add_a_photo_sharp),
          );
        },
      ),
    );
  }
}
