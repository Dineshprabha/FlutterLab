import 'package:flutter/material.dart';

class GestureApp extends StatelessWidget {
  const GestureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GestureScreen(),
    );
  }
}

class GestureScreen extends StatefulWidget {
  const GestureScreen({super.key});

  @override
  State<GestureScreen> createState() => _GestureScreenState();
}

class _GestureScreenState extends State<GestureScreen> {
  String message = "Try a Gesture!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Detection"),
        centerTitle: true,
      ),

      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              message = "👆 Single Tap";
            });
          },

          onDoubleTap: () {
            setState(() {
              message = "✌️ Double Tap";
            });
          },

          onHorizontalDragEnd: (details) {
            setState(() {
              message = details.primaryVelocity! > 0
                  ? "➡️ Swiped Right"
                  : "⬅️ Swiped Left";
            });
          },

          child: Container(
            width: 280,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}