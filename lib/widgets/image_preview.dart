import 'package:flutter/material.dart';
import 'dart:io';

Widget imagePreview(File? image) {
  return Center(
    child: Container(
      child: image != null
          ? Stack(
              children: [
                Image.file(image),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/image_2.png",
                  width: 150,
                  height: 150,
                ),
                const Text(
                  'No image selected',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
    ),
  );
}
