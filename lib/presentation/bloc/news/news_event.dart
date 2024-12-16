part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsGetTopHeadlines extends NewsEvent {}

class NewsCategoryWise extends NewsEvent {
  final String category;

  const NewsCategoryWise({required this.category});
}


