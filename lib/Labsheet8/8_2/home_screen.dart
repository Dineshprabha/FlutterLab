import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome, Student!",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              dashboardCard(
                Icons.book,
                "Courses",
                "5",
              ),
              dashboardCard(
                Icons.assignment,
                "Assignments",
                "3",
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              dashboardCard(
                Icons.event,
                "Events",
                "2",
              ),
              dashboardCard(
                Icons.notifications,
                "Notifications",
                "4",
              ),
            ],
          ),

          const Spacer(),

          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Dashboard refreshed!"),
                  ),
                );
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh"),
            ),
          ),
        ],
      ),
    );
  }

  Widget dashboardCard(
      IconData icon,
      String title,
      String value,
      ) {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icon, size: 40),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}