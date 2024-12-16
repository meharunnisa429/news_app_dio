import 'package:flutter/material.dart';
import 'package:news_app_dio/presentation/screen/view_all/widget/category_chip.dart';
import 'package:news_app_dio/presentation/screen/widgets/recommendation_card.dart';

class ViewallScreen extends StatelessWidget {
  const ViewallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // Discover Title
            const Text(
              'Discover',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // Subtitle
            const Text(
              'News from all around the world',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: const Icon(Icons.tune, color: Colors.grey),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Categories
            const CategoryChip(),

            const SizedBox(height: 8),
            const Expanded(
                child: SingleChildScrollView(child: RecommendationCard())),
          ],
        ),
      ),
    ));
  }
}
