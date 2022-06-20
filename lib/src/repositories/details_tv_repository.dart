import 'package:consumindo_api/src/models/details_tv.dart';
import 'package:dio/dio.dart';

class DetailsTvRepository {
  final Dio dio;

  DetailsTvRepository(this.dio);

  Future<DetailsTv> featchDetailsTv({required String idTv}) async {
    try {
      final response = await dio.get(
        'tv/$idTv',
        queryParameters: {
          "api_key": 'acc4540ce8fb7311a346b6e342c86fd4',
          'language': 'pt-BR',
        },
      );

      var item = DetailsTv.fromJson(response.data);

      return item;
    } catch (e) {
      print(e);
      return DetailsTv();
    }
  }
}
