import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app_dio/model/news_model.dart';
import 'package:news_app_dio/package/api_service.dart';

String apiKey = "f71c112c55cc48adb5671a971b6db46a";

class NewsRepository {
  Future<List<NewsModel>> getAllTopHeadlines() async {
    try {
      final Response response = await ApiService.get(
          path: "top-headlines",
          queryParameters: {'country': 'us', 'apiKey': apiKey});
      if (response.statusCode == 200) {
        log("data present");
        final desiredData = response.data['articles'];
        return (desiredData as List<dynamic>)
            .map((postToJson) => NewsModel.fromMap(postToJson))
            .toList();
      } else {
        throw "Something went wrong in response - getAllTopHeadlines";
      }
    } catch (e) {
      throw "Something Went Wrong with request/code - getAllTopHeadlines";
    }
  }

  Future<List<NewsModel>> getCategoryWiseNews(
      {required String category}) async {
    try {
      final Response response = await ApiService.get(
          path: "top-headlines",
          queryParameters: {'category': category, 'apiKey': apiKey});
      if (response.statusCode == 200) {
        final desiredData = response.data['articles'];
        log(desiredData.toString(), name: "categorywise data");
        return (desiredData as List<dynamic>)
            .map((postToJson) => NewsModel.fromMap(postToJson))
            .toList();
      } else {
        throw "Something went wrong in response - getAllCategoryWiseNews";
      }
    } catch (e) {
      throw "Something Went Wrong with request/code - getAllCategoryWiseNews";
    }
  }
}
