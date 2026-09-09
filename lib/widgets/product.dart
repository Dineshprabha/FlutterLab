// Product Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget product(String name, String price, IconData icon) {
  return Card(
    elevation: 3,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [

          Expanded(
            child: Icon(
              icon,
              size: 80,
            ),
          ),

          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            price,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 5),

          ElevatedButton(
            onPressed: () {},
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    ),
  );
}
