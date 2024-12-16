part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<NewsModel> newslist;

  const NewsLoaded({required this.newslist});
  @override
  List<Object> get props => [newslist];
}

final class NewsError extends NewsState {}

