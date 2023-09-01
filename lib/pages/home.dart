import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(
      {required this.imageSelector,
      required this.imagesName,
      required this.imagesPath,
      super.key});

  final Function? imageSelector;
  final List<String> imagesName;
  final List<String> imagesPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Resize'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(imagesName.toString()),
          const SizedBox(
            height: 20,
          ),
          Text(imagesPath.toString()),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          imageSelector!();
        },
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: const Icon(Icons.add_a_photo_sharp),
      ),
    );
  }
}
