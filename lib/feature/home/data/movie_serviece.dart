import 'package:dio/dio.dart';
import '../models/movie.dart';

class MovieService {
  static final Dio _dio = Dio();

  static Future<List<Movie>> fetchMovies() async {
    try {
      final response = await _dio.get('https://yts.mx/api/v2/list_movies.json');

      if (response.statusCode == 200) {
        final List moviesJson = response.data['data']['movies'];
        return moviesJson.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception(' cannot load : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('connection error: $e');
    }
  }
  static Future<List<Movie>> fetchMoviesByGenre(String genre) async {
    try {
      final response = await _dio.get(
        'https://yts.mx/api/v2/list_movies.json',
        queryParameters: {'genre': genre},
      );

      if (response.statusCode == 200) {
        final List moviesJson = response.data['data']['movies'];
        return moviesJson.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('cannot load $genre films right now');
      }
    } catch (e) {
      throw Exception('cannot load $genre films right now: $e');
    }
  }

}
