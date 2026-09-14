import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const Text(
          "Settings",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        SwitchListTile(
          title: const Text("Notifications"),
          subtitle: const Text("Receive college notifications"),
          value: notifications,
          onChanged: (value) {
            setState(() {
              notifications = value;
            });
          },
        ),

        SwitchListTile(
          title: const Text("Dark Mode"),
          subtitle: const Text("Change application appearance"),
          value: darkMode,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });
          },
        ),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.info),
          title: const Text("About"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("About"),
                  content: Text(
                    "Student Dashboard\nVersion 1.0",
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}