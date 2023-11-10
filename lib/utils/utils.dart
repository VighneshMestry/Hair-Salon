import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar (BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<File> pickImages() async {
  File images;
  try{
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    // if(files != null && files.files.isNotEmpty) {
    //   for(int i = 0; i < files.files.length; i++) {
    //     images.add(File(files.files[i].path!));
    //   }
    // }
    images = File(files!.files.single.path!);
  } catch (e) {
    debugPrint(e.toString());
    images = File('assets/user.png');
  }
  return images;

}