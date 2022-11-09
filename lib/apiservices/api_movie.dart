import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie/apiservices/movie_model.dart';

class PlayinMovieApi extends ChangeNotifier {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US');
  Future<List<MovieModel>> getplayingmoviedata() async {
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);
        List<MovieModel> playingmovieslist = results.playingmovieresults
            .map((e) => MovieModel.fromJson(e))
            .toList();
        notifyListeners();

        return playingmovieslist;
      } else {
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}

class UpCommingApi extends ChangeNotifier {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US&page=1');
  Future<List<MovieModel>> getplayingmoviedata() async {
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);
        List<MovieModel> playingmovieslist = results.playingmovieresults
            .map((e) => MovieModel.fromJson(e))
            .toList();
        notifyListeners();

        return playingmovieslist;
      } else {
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
class TvPopular extends ChangeNotifier {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/tv/popular?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US&page=1');
  Future<List<TvModel>> getplayingmoviedata() async {
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);
        List<TvModel> playingmovieslist = results.playingmovieresults
            .map((e) => TvModel.fromJson(e))
            .toList();
        notifyListeners();

        return playingmovieslist;
      } else {
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}

class PopularMovie extends ChangeNotifier {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=3bde688d09fec315b1bc2ce62084a282');
  get x => getdata();
  Future<List<MovieModel>> getdata() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);
        List<MovieModel> listofmovie = results.playingmovieresults
            .map((e) => MovieModel.fromJson(e))
            .toList();
        notifyListeners();

        return listofmovie;
      } else {
        throw (response.statusCode);
      }
    } catch (e) {
      throw ('d');
    }
  }
}

class TopRatedMoviesApi extends ChangeNotifier {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US&page=1');
  Future<List<MovieModel>> fetchtopratedmoviesapi() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);
        List<MovieModel> topratedmovieslist = results.playingmovieresults
            .map((e) => MovieModel.fromJson(e))
            .toList();
        notifyListeners();
        return topratedmovieslist;
      } else {
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}

class SimilarMoviesApi extends ChangeNotifier {
  Future<List<MovieModel>> fetchtopratedmoviesapi(id) async {
    try {
      var url = Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/similar?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US&page=1');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);
        List<MovieModel> topratedmovieslist = results.playingmovieresults
            .map((e) => MovieModel.fromJson(e))
            .toList();
        notifyListeners();
        return topratedmovieslist;
      } else {
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}

class MovieVideo extends ChangeNotifier {
  Future<List<VideoModel>> fetchtopratedmoviesapi(id) async {
    try {
      var url = Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/videos?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieVideoResult results = MovieVideoResult.fromJson(responsebody);
        List<VideoModel> video = results.movievideoresults
            .map((e) => VideoModel.fromJson(e))
            .toList();
        notifyListeners();
        return video;
      } else {
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}

class TvVideo extends ChangeNotifier {
  Future<List<VideoModel>> fetchtopratedmoviesapi(id) async {
    try {
      var url = Uri.parse(
          'https://api.themoviedb.org/3/tv/$id/videos?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieVideoResult results = MovieVideoResult.fromJson(responsebody);
        List<VideoModel> video = results.movievideoresults
            .map((e) => VideoModel.fromJson(e))
            .toList();
        notifyListeners();
        return video;
      } else {
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
