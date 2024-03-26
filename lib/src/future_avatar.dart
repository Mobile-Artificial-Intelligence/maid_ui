import 'dart:io';

import 'package:flutter/material.dart';

class FutureAvatar extends StatelessWidget {
  final Future<File> image;
  final double? radius;

  const FutureAvatar({super.key, required this.image, this.radius});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: image,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Icon(Icons.error);
          } else {
            return CircleAvatar(
              backgroundImage: FileImage(snapshot.data!),
              radius: radius,
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}