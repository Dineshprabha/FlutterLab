import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile Card",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),

        body: Center(
          child: Card(
            elevation: 28,

            child: Container(
              width: 350,
              padding: const EdgeInsets.all(60),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // Profile Image
                  Image.asset(
                    'assets/images/profile.png',
                    width: 120,
                    height: 120,
                  ),

                  const SizedBox(height: 20),

                  // Name
                  const Text(
                    "Dinesh N",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Designation
                  const Text(
                    "Assistant Professor",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Department
                  const Text(
                    "School of Information Science",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // University
                  const Text(
                    "Presidency University, Bengaluru",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Contact Information
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          "Email: dinesh@example.com",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Mobile: 9876543210",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
