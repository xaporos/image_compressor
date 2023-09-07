import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';

class ListOfImages extends StatelessWidget {
  const ListOfImages({required this.images, super.key});

  final RxList<XFile> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.grey[300],
            margin: const EdgeInsets.all(2),
            child: ListTile(
              leading: GFAvatar(
                backgroundImage: FileImage(File(images[index].path)),
                shape: GFAvatarShape.standard,
                size: 26,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  print('delete: ${images[index]}');
                },
              ),
              // ignore: unnecessary_string_interpolations
              title: Text('${images[index].name}'),
            ),
          );
        },
      ),
    );
  }
}
