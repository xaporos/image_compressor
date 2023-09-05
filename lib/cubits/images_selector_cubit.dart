import 'package:file_selector/file_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesSelectorCubit extends Cubit<List<XFile>> {
  ImagesSelectorCubit() : super([]);

  void selectImages() async {
    const XTypeGroup jpgsTypeGroup = XTypeGroup(
      label: 'JPEGs',
      extensions: <String>['jpg', 'JPG', 'jpeg'],
    );
    const XTypeGroup pngTypeGroup = XTypeGroup(
      label: 'PNGs',
      extensions: <String>['png'],
    );
    final List<XFile> files = await openFiles(acceptedTypeGroups: <XTypeGroup>[
      jpgsTypeGroup,
      pngTypeGroup,
    ]);

    emit(files);
  }
}
