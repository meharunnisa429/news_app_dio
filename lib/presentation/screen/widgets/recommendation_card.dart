import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_dio/presentation/bloc/news/news_bloc.dart';
import 'package:news_app_dio/presentation/screen/news_content/new_content_screen.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final news = state.newslist[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return NewsContentScreen(
                        news: news,
                      );
                    }));
                  },
                  child: SizedBox(
                    // height: 150,
                    child: Row(
                      children: [
                        // Thumbnail Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            imageUrl:
                                news.urlToImage != null ? news.urlToImage! : "",
                            errorWidget: (context, url, error) => Image.asset(
                              "assets/images/noImage.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),
                        // Text Content
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                news.title != null
                                    ? SizedBox(
                                        height: 40,
                                        child: Text(
                                          news.title ?? "Title",
                                          maxLines: 2,
                                          style: const TextStyle(
                                            overflow: TextOverflow.fade,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.red,
                                    ),
                                    Text(
                                      news.publishedAt ?? "Date ",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: state.newslist.length,
          );
        }
        return const Text("Loading");
      },
    );
  }
}
