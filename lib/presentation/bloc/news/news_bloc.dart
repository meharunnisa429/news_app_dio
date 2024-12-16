import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_dio/model/news_model.dart';
import 'package:news_app_dio/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository = NewsRepository();
  NewsBloc() : super(NewsInitial()) {
    on<NewsGetTopHeadlines>(_getTopHeadlines);
    on<NewsCategoryWise>(_categoryWise);
  }
  _getTopHeadlines(NewsGetTopHeadlines event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      List<NewsModel> newslist = await newsRepository.getAllTopHeadlines();
      emit(NewsLoaded(
        newslist: newslist,
      ));
    } catch (e) {
      emit(NewsError());
    }
  }

  _categoryWise(NewsCategoryWise event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      List<NewsModel> newslist =
          await newsRepository.getCategoryWiseNews(category: event.category);
      emit(NewsLoaded(newslist: newslist));
    } catch (e) {
      emit(NewsError());
    }
  }
}
