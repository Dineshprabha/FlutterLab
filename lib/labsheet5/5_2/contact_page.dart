import 'package:flutter/material.dart';
import 'ContactCard.dart';
import 'contact_list_item.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ContactsPage(),
    );
  }
}

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  // Contact data
  final List<Map<String, String>> contacts = const [
    {
      "name": "Rahul",
      "phone": "9876543210",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Priya",
      "phone": "9876543211",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Arun",
      "phone": "9876543212",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Sneha",
      "phone": "9876543213",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Kiran",
      "phone": "9876543214",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Anjali",
      "phone": "9876543215",
      "image": "assets/images/profile.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contacts Directory",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          centerTitle: true,

          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: "List",
              ),
              Tab(
                icon: Icon(Icons.grid_view),
                text: "Grid",
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [

            ListView.builder(
              itemCount: contacts.length,

              itemBuilder: (context, index) {
                return ContactListItem(
                  name: contacts[index]["name"]!,
                  phone: contacts[index]["phone"]!,
                  image: contacts[index]["image"]!,
                );
              },
            ),

            GridView.builder(
              padding: const EdgeInsets.all(10),

              itemCount: contacts.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),

              itemBuilder: (context, index) {
                return ContactCard(
                  name: contacts[index]["name"]!,
                  phone: contacts[index]["phone"]!,
                  image: contacts[index]["image"]!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}