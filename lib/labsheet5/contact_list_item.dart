import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final String name;
  final String phone;
  final String image;

  const ContactListItem({
    super.key,
    required this.name,
    required this.phone,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),

        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        subtitle: Text(phone),

        trailing: const Icon(
          Icons.phone,
        ),
      ),
    );
  }
}