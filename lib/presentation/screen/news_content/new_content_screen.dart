import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_dio/model/news_model.dart';

class NewsContentScreen extends StatelessWidget {
  final NewsModel news;
  const NewsContentScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          CachedNetworkImage(
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: news.urlToImage ?? "",
            errorWidget: (context, url, error) => Image.asset(
              "assets/images/noImage.jpg",
              fit: BoxFit.cover,
            ),
          ),
          // Article content
          Column(
            children: [
              const SizedBox(height: 250),
              // Card Content
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Badge
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Sports',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Trending • 6 hours ago',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Title
                        Text(
                          news.title ?? "",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Source content

                        const SizedBox(height: 20),
                        // Article body
                        Text(
                          news.description ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          news.content ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Back and other icons
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                backgroundColor: Colors.black45,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          const Positioned(
            top: 40,
            right: 16,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(Icons.bookmark_border, color: Colors.white),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(Icons.share, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
