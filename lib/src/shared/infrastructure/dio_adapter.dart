import 'package:dio/dio.dart';

BaseOptions _baseOptions = BaseOptions(
  baseUrl: 'https://api.themoviedb.org/3/',
  connectTimeout: 5000,
  receiveTimeout: 5000,
);

final Dio dio = Dio(_baseOptions);
