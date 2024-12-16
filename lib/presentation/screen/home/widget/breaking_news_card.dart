import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_dio/model/news_model.dart';

class BreakingNewsCard extends StatelessWidget {
  final NewsModel news;
  const BreakingNewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            imageUrl: news.urlToImage ?? "",
            errorWidget: (context, url, error) => Image.asset(
              "assets/images/noImage.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        // Text Content
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(
                label: const Text(
                  'Sports',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(25), // Smaller corner radius
                ),
              ),
              const SizedBox(height: 5),
              Text(
                news.title ?? "",
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                news.author ?? "author",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
