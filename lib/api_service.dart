import 'dart:convert';



import 'constant.dart';
import 'movie_model.dart';
import 'package:http/http.dart' as http;

class Api{

  static const _tendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apikey}';

  static const _toRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apikey}';
  static const _upcomingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apikey}';
  Future<List<Movie>> getTrendingMovies() async{



    final response = await http.get(Uri.parse(_tendingUrl));

    if(response.statusCode == 200){


      final decodedata = json.decode(response.body)['results'] as List;


      return decodedata.map((movie) => Movie.fromJson(movie)).toList();


    }else{

      throw Exception("SOMETHING HAPPEND");
    }







  }
  Future<List<Movie>> getTopRatedMovies() async{



    final response = await http.get(Uri.parse(_toRatedUrl));

    if(response.statusCode == 200){


      final decodedata = json.decode(response.body)['results'] as List;


      return decodedata.map((movie) => Movie.fromJson(movie)).toList();


    }else{

      throw Exception("SOMETHING HAPPEND");
    }







  }

  Future<List<Movie>> getUpComingMovies() async{



    final response = await http.get(Uri.parse(_upcomingUrl));

    if(response.statusCode == 200){


      final decodedata = json.decode(response.body)['results'] as List;


      return decodedata.map((movie) => Movie.fromJson(movie)).toList();


    }else{

      throw Exception("SOMETHING HAPPEND");
    }







  }
}