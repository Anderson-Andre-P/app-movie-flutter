import 'package:consumindo_api/src/models/genre_tv.dart';
import 'package:dio/dio.dart';

class GenreTvRepository {
  final Dio dio;

  GenreTvRepository(this.dio);

  Future<List<GenreTv>> featchGenreTv() async {
    try {
      final response = await dio.get(
        'genre/tv/list',
        queryParameters: {
          "api_key": 'acc4540ce8fb7311a346b6e342c86fd4',
          'language': 'pt-BR',
        },
      );

      List<GenreTv> listGenreTv = <GenreTv>[];

      for (var element in response.data['genres']) {
        var item = GenreTv.fromJson(element);
        listGenreTv.add(item);
      }

      return listGenreTv;
    } catch (e) {
      print(e);
      return <GenreTv>[];
    }
  }
}
