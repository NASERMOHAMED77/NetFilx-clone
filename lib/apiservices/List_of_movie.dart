import 'package:flutter/cupertino.dart';
import 'package:movie/apiservices/api_movie.dart';
import 'package:movie/apiservices/movie_model.dart';

class PlayinMovieListview extends ChangeNotifier {
  List<MovieModel> playingmoviemodelview = [];
  fetchdata() async {
    playingmoviemodelview = await PlayinMovieApi().getplayingmoviedata();
    notifyListeners();
  }
}

class PopMoviesList extends ChangeNotifier {
  List<MovieModel> popmovieslist = [];
  fetchdata() async {
    popmovieslist = await PopularMovie().getdata();
    notifyListeners();
  }
}

class TopRatedMoviesList extends ChangeNotifier {
  List<MovieModel> toprated = [];
  Future fetchdata() async {
    toprated = await TopRatedMoviesApi().fetchtopratedmoviesapi();
    notifyListeners();
  }
}

class UpComingList extends ChangeNotifier {
  List<MovieModel> toprated = [];
  Future fetchdata() async {
    toprated = await UpCommingApi().getplayingmoviedata();
    notifyListeners();
  }
}

class TvPopularList extends ChangeNotifier {
  List<TvModel> toprated = [];
  Future fetchdata() async {
    toprated = await TvPopular().getplayingmoviedata();
    notifyListeners();
  }
}

class SimilarMovieList extends ChangeNotifier {
  List<MovieModel> toprated = [];
  Future fetchdata(id) async {
    toprated = await SimilarMoviesApi().fetchtopratedmoviesapi(id);
    notifyListeners();
  }
}

class MovieVideoList extends ChangeNotifier {
  List<VideoModel> toprated = [];
  Future fetchdata(id) async {
    toprated = await MovieVideo().fetchtopratedmoviesapi(id);
    notifyListeners();
  }
}

class TvMovieList extends ChangeNotifier {
  List<VideoModel> toprated = [];
  Future fetchdata(id) async {
    toprated = await TvVideo().fetchtopratedmoviesapi(id);
    notifyListeners();
  }
}
