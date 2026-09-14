import 'package:flutter/material.dart';

class CollegeDrawer extends StatelessWidget {
  final void Function(int) onItemSelected;

  const CollegeDrawer({
    super.key,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.school, size: 50),
                SizedBox(height: 10),
                Text(
                  "My College",
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              onItemSelected(0);
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Courses"),
            onTap: () {
              onItemSelected(1);
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              onItemSelected(2);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}