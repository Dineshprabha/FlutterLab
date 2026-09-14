import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: animate ? 1.2 : 1,
              duration: const Duration(seconds: 1),
              child: AnimatedOpacity(
                opacity: animate ? 1 : 0.5,
                duration: const Duration(seconds: 1),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: animate ? 280 : 220,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: animate ? Colors.blue : Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: animate ? 55 : 45,
                        backgroundImage: const NetworkImage(
                          "https://i.pravatar.cc/150?img=12",
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Dinesh N",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Flutter Developer",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () => setState(() => animate = !animate),
              child: Text(animate ? "Reset Profile" : "Animate Profile"),
            ),
          ],
        ),
      ),
    );
  }
}