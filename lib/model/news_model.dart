// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      author: map['author'] != null ? map['author'] as String : "",
      title: map['title'] != null ? map['title'] as String : "",
      description:
          map['description'] != null ? map['description'] as String : "",
      url: map['url'] != null ? map['url'] as String : "",
      urlToImage: map['urlToImage'] != null ? map['urlToImage'] as String : "",
      publishedAt:
          map['publishedAt'] != null ? map['publishedAt'] as String : "",
      content: map['content'] != null ? map['content'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
