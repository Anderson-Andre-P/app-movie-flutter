import 'package:consumindo_api/src/models/tv_popular.dart';
import 'package:dio/dio.dart';

class TvPopularRepository {
  final Dio dio;
  int page = 1;
  int totalPages = 0;

  TvPopularRepository(this.dio);

  Future<List<TvPopular>> featchTvPopular() async {
    try {
      List<TvPopular> listTvPopular = <TvPopular>[];

      final response = await dio.get('tv/popular', queryParameters: {
        "api_key": 'acc4540ce8fb7311a346b6e342c86fd4',
        'language': 'pt-BR',
        'page': page,
      });

      for (var element in response.data['results']) {
        var item = TvPopular.fromJson(element);
        listTvPopular.add(item);
      }

      return listTvPopular;
    } catch (e) {
      print(e);
      return <TvPopular>[];
    }
  }

  Future<List<TvPopular>> featchGenrePageTv(
      {String? genre, bool nextPage = false}) async {
    try {
      List<TvPopular> listTv = <TvPopular>[];

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
        '/tv/top_rated',
        queryParameters: queryParameters,
      );

      page = response.data['page'];
      totalPages = response.data['total_pages'];

      for (var element in response.data['results']) {
        var item = TvPopular.fromJson(element);
        listTv.add(item);
      }

      return listTv;
    } catch (e) {
      return <TvPopular>[];
    }
  }
}
