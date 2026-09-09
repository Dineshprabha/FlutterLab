
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget category(String name, IconData icon) {
  return Container(
    width: 100,
    margin: const EdgeInsets.only(left: 15),
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}