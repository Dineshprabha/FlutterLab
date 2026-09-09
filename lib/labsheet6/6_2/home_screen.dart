import 'package:flutter/material.dart';
import 'student_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Controllers to get input from the user
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Application",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.school,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              "Enter Student Details",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // Name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
                hintText: "Enter student name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            // Roll Number
            TextField(
              controller: rollNoController,
              decoration: const InputDecoration(
                labelText: "Roll Number",
                hintText: "Enter roll number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.badge),
              ),
            ),

            const SizedBox(height: 15),

            // Course
            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: "Course",
                hintText: "Enter course",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.book),
              ),
            ),

            const SizedBox(height: 15),

            // Semester
            TextField(
              controller: semesterController,
              decoration: const InputDecoration(
                labelText: "Semester",
                hintText: "Enter semester",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school),
              ),
            ),

            const SizedBox(height: 15),

            // Email
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 15),

            // Phone
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                hintText: "Enter phone number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),

            const SizedBox(height: 25),

            // View Details Button
            ElevatedButton(
              onPressed: () {

                // Get values from TextFields
                String name = nameController.text;
                String rollNo = rollNoController.text;
                String course = courseController.text;
                String semester = semesterController.text;
                String email = emailController.text;
                String phone = phoneController.text;

                // Navigate to Student Details Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDetailsScreen(
                      name: name,
                      rollNo: rollNo,
                      course: course,
                      semester: semester,
                      email: email,
                      phone: phone,
                    ),
                  ),
                );
              },

              child: const Text(
                "View Student Details",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}