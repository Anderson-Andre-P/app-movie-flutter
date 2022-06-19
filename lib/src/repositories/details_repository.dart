import 'package:consumindo_api/src/models/details.dart';
import 'package:dio/dio.dart';

class DetailsRepository {
  final Dio dio;

  DetailsRepository(this.dio);

  Future<Details> featchDetails({int? idMovie}) async {
    try {
      final response = await dio.get(
        'movie/$idMovie',
        queryParameters: {
          "api_key": 'acc4540ce8fb7311a346b6e342c86fd4',
          'language': 'pt-BR',
        },
      );

      Details item = Details.fromJson(response.data);

      return item;
    } catch (e) {
      print(e);
      return Details();
    }
  }
}
