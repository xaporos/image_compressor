import 'package:flutter/material.dart';
import 'package:image_compressor/app/app.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: App(),
        ),
      ),
    );
  }
}
