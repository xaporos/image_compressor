import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfImages extends StatelessWidget {
  const ListOfImages({required this.imageNameList, super.key});

  final RxList<String> imageNameList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: imageNameList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: const Icon(Icons.delete),
            // ignore: unnecessary_string_interpolations
            title: Text('${imageNameList[index]}'),
          );
        },
      ),
    );
  }
}
