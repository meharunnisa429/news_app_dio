import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_dio/presentation/bloc/news/news_bloc.dart';

class CategoryChip extends StatelessWidget {
  final bool isSelected;

  const CategoryChip({this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> indexNotifier = ValueNotifier(0);
    List<String> categoryList = [
      "All",
      "Business",
      "Entertainment",
      "General",
      "Health",
      "Science",
      "Sports",
      "Technology"
    ];
    return ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (BuildContext context, int count, Widget? _) {
          return SizedBox(
            height: 40,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  final label = categoryList[index];
                  return InkWell(
                    onTap: () {
                      indexNotifier.value = index;
                      indexNotifier.notifyListeners();
                      if (index == 0) {
                        context.read<NewsBloc>().add(NewsGetTopHeadlines());
                      } else {
                        context
                            .read<NewsBloc>()
                            .add(NewsCategoryWise(category: label));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: count == index
                                ? Colors.blue
                                : Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: count == index ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
