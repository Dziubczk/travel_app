
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildImage({imagePath, onClicked}) {
  final image = NetworkImage(imagePath);

  return Material(
    color: Colors.transparent,
    child: Ink.image(
      image: image,
      fit: BoxFit.cover,
      width: 150,
      height: 200,
      child: InkWell(onTap: onClicked),
    ),
  );
}