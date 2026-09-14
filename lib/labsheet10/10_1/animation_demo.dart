import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Basic Animation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: animate ? 1 : 0.3,
              duration: const Duration(seconds: 1),
              child: AnimatedScale(
                scale: animate ? 1.4 : 1,
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: animate ? 200 : 120,
                  height: animate ? 200 : 120,
                  color: animate ? Colors.blue : Colors.indigo,
                  child: const Icon(
                    Icons.flutter_dash,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () => setState(() => animate = !animate),
              child: Text(animate ? "Reset" : "Animate"),
            ),
          ],
        ),
      ),
    );
  }
}