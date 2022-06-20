import 'package:consumindo_api/src/models/tv_popular.dart';
import 'package:consumindo_api/src/repositories/tv_popular_repository.dart';

class TvPopularController {
  final TvPopularRepository _repository;
  List<TvPopular> tvPopular = <TvPopular>[];

  TvPopularController(this._repository);

  Future<List<TvPopular>> getTvPopular() async {
    return await _repository.featchTvPopular();
  }
}
