import 'package:consumindo_api/src/models/tv_popular.dart';
import 'package:dio/dio.dart';

class TvPopularRepository {
  final Dio dio;
  int page = 1;

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
      return <TvPopular>[];
    }
  }
}
