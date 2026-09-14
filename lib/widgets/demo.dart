import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FilledButton(onPressed: (){
          print("Button Clicke");
        }, child: Text("Button"))
    );
  }
}