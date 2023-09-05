import 'package:flutter/material.dart';

class ListOfImages extends StatelessWidget {
  const ListOfImages({required this.imagesNameList, super.key});

  final List<String> imagesNameList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: imagesNameList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: const Icon(Icons.delete),
            // ignore: unnecessary_string_interpolations
            title: Text('${imagesNameList[index]}'),
          );
        },
      ),
    );
  }
}
