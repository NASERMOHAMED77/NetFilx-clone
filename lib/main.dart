import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/apiservices/List_of_movie.dart';
import 'package:movie/home.dart';
import 'package:movie/netfilx.dart';
import 'package:movie/splashScreen.dart';
import 'package:movie/widget.dart';
import 'package:provider/provider.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MultiProvider(providers: [
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PopMoviesList>(
          create: (context) => PopMoviesList(),
        ),
        ChangeNotifierProvider<PlayinMovieListview>(
          create: (context) => PlayinMovieListview(),
        ),
        ChangeNotifierProvider<TvPopularList>(
          create: (context) => TvPopularList(),
        ),
        ChangeNotifierProvider<TopRatedMoviesList>(
          create: (context) => TopRatedMoviesList(),
        ),
        ChangeNotifierProvider<UpComingList>(
          create: (context) => UpComingList(),
        ),
        ChangeNotifierProvider<MovieVideoList>(
          create: (context) => MovieVideoList(),
        ),
        ChangeNotifierProvider<TvMovieList>(
          create: (context) => TvMovieList(),
        ),
        ChangeNotifierProvider<SimilarMovieList>(
          create: (context) => SimilarMovieList(),
        ),
        ChangeNotifierProvider<X>(
          create: (context) => X(),
        )
      ],
    )
  ], child: MyApp()));
  ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: NetFlix(),
    );
  }
}
