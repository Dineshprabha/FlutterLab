import 'package:flutter/material.dart';

class CollegeApp extends StatefulWidget {
  const CollegeApp({super.key});

  @override
  State<CollegeApp> createState() => _CollegeAppState();
}

class _CollegeAppState extends State<CollegeApp> {
  Color themeColor = Colors.indigo;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
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
          title: const Text("My College"),
          centerTitle: true,
          actions: [
            Switch(
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ],
        ),

        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  // College Banner
                  Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Icon(
                            Icons.school,
                            size: 70,
                            color: themeColor,
                          ),
                          const SizedBox(height: 10),

                          Text(
                            "Welcome to My College",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Learn • Innovate • Grow",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Responsive Cards
                  GridView.count(
                    crossAxisCount:
                    constraints.maxWidth > 600 ? 4 : 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      infoCard(
                        Icons.menu_book,
                        "Courses",
                        "12 Programs",
                      ),
                      infoCard(
                        Icons.people,
                        "Faculty",
                        "50+ Faculty",
                      ),
                      infoCard(
                        Icons.event,
                        "Events",
                        "Upcoming Events",
                      ),
                      infoCard(
                        Icons.phone,
                        "Contact",
                        "Get in Touch",
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Theme Selection
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Choose Theme",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      colorButton(Colors.indigo),
                      colorButton(Colors.blue),
                      colorButton(Colors.green),
                      colorButton(Colors.orange),
                      colorButton(Colors.purple),
                    ],
                  ),

                  const SizedBox(height: 25),

                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Welcome to My College!",
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.school),
                    label: const Text("Explore College"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget infoCard(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$title selected"),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: themeColor,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget colorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          themeColor = color;
        });
      },
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color,
        child: themeColor == color
            ? const Icon(
          Icons.check,
          color: Colors.white,
        )
            : null,
      ),
    );
  }
}