import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = ["MCA", "BCA", "B.Tech"];

    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(
              Icons.menu_book,
              color: Colors.indigo,
            ),
            title: Text(courses[index]),
            subtitle: const Text("View course information"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${courses[index]} selected"),
                ),
              );
            },
          ),
        );
      },
    );
  }
}