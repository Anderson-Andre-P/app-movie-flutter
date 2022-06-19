import 'package:consumindo_api/src/models/movie.dart';
import 'package:dio/dio.dart';

// date format flutter pluggin
class MovieRepository {
  final Dio dio;
  int page = 1;
  int totalPages = 0;

  MovieRepository(this.dio);

  Future<List<Movie>> featchMovie() async {
    try {
      List<Movie> listMovie = <Movie>[];

      final response = await dio.get(
        '/movie/top_rated',
        queryParameters: {
          "api_key": 'acc4540ce8fb7311a346b6e342c86fd4',
          'language': 'pt-BR',
          'page': page,
        },
      );

      for (var element in response.data['results']) {
        var item = Movie.fromJson(element);
        listMovie.add(item);
      }

      return listMovie;
    } catch (e) {
      return <Movie>[];
    }
  }

  Future<List<Movie>> featchGenrePageMovie(
      {String? genre, bool nextPage = false}) async {
    try {
      List<Movie> listMovie = <Movie>[];

      if (nextPage) {
        if (page < totalPages) {
          page++;
        }
      } else {
        page = 1;
      }

      Map<String, dynamic> queryParameters = {
        "api_key": 'acc4540ce8fb7311a346b6e342c86fd4',
        'language': 'pt-BR',
        'page': page,
      };

      if (genre != null) {
        queryParameters['with_genres'] = genre;
      }

      final response = await dio.get(
        '/movie/top_rated',
        queryParameters: queryParameters,
      );

      page = response.data['page'];
      totalPages = response.data['total_pages'];

      for (var element in response.data['results']) {
        var item = Movie.fromJson(element);
        listMovie.add(item);
      }

      return listMovie;
    } catch (e) {
      return <Movie>[];
    }
  }
}
