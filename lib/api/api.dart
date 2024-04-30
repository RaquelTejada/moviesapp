import '../models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  final upcomingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=e4a0685c6e18be6ba3584c6688ac5f1e";
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=e4a0685c6e18be6ba3584c6688ac5f1e";
  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=e4a0685c6e18be6ba3584c6688ac5f1e";

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upcomingApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }
}
