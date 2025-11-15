import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  // Example data for demonstration
  final List<Map<String, String>> movies = const [
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
    {
      'image': 'assets/images/black_widow_2.jpg',
      'title': 'Black Widow',
      'rating': '7.7',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: AspectRatio(
                        aspectRatio: 0.65,
                        child: Image.asset(
                          movie['image'] ?? 'assets/images/placeholder.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: Colors.grey[800],
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xB5121312),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            movie['rating'] ?? '-',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.star,
                            color: Color(0xFFF6BD00),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}