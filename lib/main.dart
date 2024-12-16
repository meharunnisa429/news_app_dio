import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_dio/presentation/bloc/news/news_bloc.dart';
import 'package:news_app_dio/presentation/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(create: (BuildContext context) => NewsBloc())
      ],
      child: const MaterialApp(
        home: NewsHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
