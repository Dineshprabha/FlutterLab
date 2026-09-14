import 'package:flutter/material.dart';
import 'package:labsheet1/widgets/category.dart';
import 'package:labsheet1/widgets/product.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Store',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search))
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Search Bar
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              // Categories Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Categories
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    category('Electronics', Icons.phone_android),
                    category('Fashion', Icons.checkroom),
                    category('Grocery', Icons.shopping_basket),
                    category('Beauty', Icons.face),
                    category('Sports', Icons.sports_soccer),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Products Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Popular Products',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Products
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,

                children: [

                  product(
                    'Smartphone',
                    '₹19,999',
                    Icons.phone_android,
                  ),

                  product(
                    'Laptop',
                    '₹59,999',
                    Icons.laptop,
                  ),

                  product(
                    'Headphones',
                    '₹2,999',
                    Icons.headphones,
                  ),

                  product(
                    'Smart Watch',
                    '₹4,999',
                    Icons.watch,
                  ),

                  product(
                    'Smart Watch',
                    '₹4,999',
                    Icons.watch,
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}