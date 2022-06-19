import 'package:consumindo_api/src/models/genre.dart';
import 'package:dio/dio.dart';

class GenreRepository {
  final Dio dio;

  GenreRepository(this.dio);

  Future<List<Genre>> featchGenre() async {
    try {
      final response = await dio.get(
        'genre/movie/list',
        queryParameters: {
          "api_key": 'acc4540ce8fb7311a346b6e342c86fd4',
          'language': 'pt-BR',
        },
      );

      List<Genre> listGenre = <Genre>[];

      for (var element in response.data['genres']) {
        var item = Genre.fromJson(element);
        listGenre.add(item);
      }

      return listGenre;
    } catch (e) {
      print(e);
      return <Genre>[];
    }
  }
}
