import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Color appColor = Colors.indigo;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ThemeData
      theme: ThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.indigo,

        scaffoldBackgroundColor:
        darkMode ? Colors.grey[900] : Colors.grey[100],

        appBarTheme: AppBarTheme(
          backgroundColor: appColor,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColor,
            foregroundColor: Colors.white,
          ),
        ),
      ),

      home: HomeScreen(
        appColor: appColor,
        darkMode: darkMode,

        // Change theme
        onThemeChanged: (color) {
          setState(() {
            appColor = color;
          });
        },

        // Change dark/light mode
        onModeChanged: (value) {
          setState(() {
            darkMode = value;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {

  final Color appColor;
  final bool darkMode;
  final Function(Color) onThemeChanged;
  final Function(bool) onModeChanged;

  const HomeScreen({
    super.key,
    required this.appColor,
    required this.darkMode,
    required this.onThemeChanged,
    required this.onModeChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double fontSize = 24;
  bool boldText = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Theme Playground",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // Preview Card
            Card(
              elevation: 8,

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),

                child: Column(
                  children: [

                    Icon(
                      Icons.palette,
                      size: 70,
                      color: widget.appColor,
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "Flutter Styling",
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: boldText
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: widget.appColor,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Experiment with colors, themes and text styles!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "You clicked the styled button!",
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Test Button",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Color Selection
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

            const SizedBox(height: 30),

            // Font Size
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Change Font Size",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Slider(
              value: fontSize,
              min: 16,
              max: 40,
              divisions: 12,

              label: fontSize.round().toString(),

              onChanged: (value) {
                setState(() {
                  fontSize = value;
                });
              },
            ),

            Text(
              "Font Size: ${fontSize.round()}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            // Bold Text
            SwitchListTile(
              title: const Text(
                "Bold Text",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              value: boldText,

              onChanged: (value) {
                setState(() {
                  boldText = value;
                });
              },
            ),

            // Dark Mode
            SwitchListTile(
              title: const Text(
                "Dark Mode",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              value: widget.darkMode,

              onChanged: widget.onModeChanged,
            ),

            const SizedBox(height: 20),

            Text(
              "You are customizing Flutter UI!",
              style: TextStyle(
                fontSize: 18,
                color: widget.appColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Color button
  Widget colorButton(Color color) {
    return GestureDetector(
      onTap: () {
        widget.onThemeChanged(color);
      },

      child: CircleAvatar(
        radius: 25,
        backgroundColor: color,
        child: widget.appColor == color
            ? const Icon(
          Icons.check,
          color: Colors.white,
        )
            : null,
      ),
    );
  }
}