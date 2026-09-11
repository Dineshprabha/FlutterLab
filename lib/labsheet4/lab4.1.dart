import 'package:flutter/material.dart';

class BasicWidget extends StatefulWidget {
  const BasicWidget({super.key});

  @override
  State<BasicWidget> createState() => _MyAppState();
}

class _MyAppState extends State<BasicWidget> {
  String name = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('School of Information Science'),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Title
                const Text(
                  'Presidency University, Bangalore',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // Image
                Image.asset(
                  'assets/images/pulogo.png',
                  width: 150,
                  height: 150,
                ),

                const SizedBox(height: 20),

                // Description
                const Text(
                  'Welcome to the Flutter Mobile Application Development Lab.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 25),

                // Text Field
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),

                  onChanged: (value) {
                    name = value;
                  },
                ),

                const SizedBox(height: 20),

                // Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      message = 'Hello, $name!';
                    });
                  },
                  child: const Text('Click Here'),
                ),

                const SizedBox(height: 20),

                // Message
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}