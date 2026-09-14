import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int selected = 0;

  final images = [
    'https://picsum.photos/id/1015/600/400',
    'https://picsum.photos/id/1016/600/400',
    'https://picsum.photos/id/1018/600/400',
    'https://picsum.photos/id/1025/600/400',
  ];

  void nextImage() {
    setState(() {
      selected = (selected + 1) % images.length;
    });
  }

  void previousImage() {
    setState(() {
      selected = (selected - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Image Gallery"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          // Main Image
          GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                nextImage();
              } else {
                previousImage();
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                images[selected],
                width: 350,
                height: 230,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Image ${selected + 1} of ${images.length}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Image Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selected == index
                          ? Colors.blue
                          : Colors.grey,
                      width: 3,
                    ),
                  ),
                  child: Image.network(
                    images[index],
                    width: 65,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          const Spacer(),

          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: previousImage,
                icon: const Icon(Icons.arrow_back),
                label: const Text("Previous"),
              ),
              ElevatedButton.icon(
                onPressed: nextImage,
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Next"),
              ),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}