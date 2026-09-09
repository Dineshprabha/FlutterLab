import 'package:flutter/material.dart';

class ThemeApp extends StatefulWidget {
  const ThemeApp({super.key});

  @override
  State<ThemeApp> createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  Color themeColor = Colors.indigo;
  bool darkMode = false;
  bool boldText = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.indigo,

        appBarTheme: AppBarTheme(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: themeColor,
            foregroundColor: Colors.white,
          ),
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Theme Playground"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              // Preview
              Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(25),

                  child: Column(
                    children: [
                      Icon(
                        Icons.palette,
                        size: 70,
                        color: themeColor,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Flutter Styling",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: boldText
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: themeColor,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Play with Theme, Colors and Text Styles!",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose Theme Color",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  colorButton(Colors.indigo),
                  colorButton(Colors.blue),
                  colorButton(Colors.green),
                  colorButton(Colors.orange),
                  colorButton(Colors.purple),
                ],
              ),

              const SizedBox(height: 25),

              // Bold Text
              SwitchListTile(
                title: const Text("Bold Text"),
                value: boldText,
                onChanged: (value) {
                  setState(() {
                    boldText = value;
                  });
                },
              ),

              // Dark Mode
              SwitchListTile(
                title: const Text("Dark Mode"),
                value: darkMode,
                onChanged: (value) {
                  setState(() {
                    darkMode = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Great! You styled the app!"),
                    ),
                  );
                },
                child: const Text("Test My Theme"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Color selection button
  Widget colorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          themeColor = color;
        });
      },

      child: CircleAvatar(
        radius: 25,
        backgroundColor: color,
        child: themeColor == color
            ? const Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }
}