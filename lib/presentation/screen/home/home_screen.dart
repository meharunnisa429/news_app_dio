import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_dio/presentation/bloc/news/news_bloc.dart';
import 'package:news_app_dio/presentation/screen/home/widget/breaking_news_card.dart';
import 'package:news_app_dio/presentation/screen/news_content/new_content_screen.dart';
import 'package:news_app_dio/presentation/screen/view_all/view_all_screen.dart';
import 'package:news_app_dio/presentation/screen/widgets/recommendation_card.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({Key? key}) : super(key: key);

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  void initState() {
    // TODO: implement initState
    context.read<NewsBloc>().add(NewsGetTopHeadlines());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Breaking News',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breaking News Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breaking News',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoaded) {
                    return Column(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                              aspectRatio: 2.0,
                              height: 160,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                _currentIndex.value = index;
                                _currentIndex.notifyListeners();
                              }),
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return NewsContentScreen(
                                    news: state.newslist[itemIndex],
                                  );
                                }));
                              },
                              child: BreakingNewsCard(
                                news: state.newslist[itemIndex],
                              ),
                            );
                          },
                          itemCount: state.newslist.length > 5
                              ? 5
                              : state.newslist.length,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ValueListenableBuilder<int>(
                          valueListenable: _currentIndex,
                          builder: (context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                state.newslist.length > 5
                                    ? 5
                                    : state.newslist.length,
                                (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  height: 10.0,
                                  width: value == index ? 20.0 : 10.0,
                                  decoration: BoxDecoration(
                                    color: value == index
                                        ? Colors.blue
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Text("data");
                    },
                    itemCount: 3,
                  );
                },
              ),

              const SizedBox(height: 20),
              // Recommendation Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommendation',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    child: const Text("View All"),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const ViewallScreen();
                      }));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const RecommendationCard()
            ],
          ),
        ),
      ),
    );
  }
}
