import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<File> pickImages() async {
  File images;
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (files !=  null) {
      images = File(files.files.single.path!);
    } else {
      images = File('');
    }
  } catch (e) {
    debugPrint(e.toString());
    images = File('assets/user.png');
  }
  return images;
}
