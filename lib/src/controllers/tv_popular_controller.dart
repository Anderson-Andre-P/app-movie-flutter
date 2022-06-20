import 'package:consumindo_api/src/models/tv_popular.dart';
import 'package:consumindo_api/src/repositories/tv_popular_repository.dart';

class TvPopularController {
  final TvPopularRepository _repository;
  List<TvPopular> tvPopular = <TvPopular>[];

  TvPopularController(this._repository);

  Future<List<TvPopular>> getTvPopular() async =>
      tvPopular = await _repository.featchTvPopular();

  Future<void> getGenrePageTv({String? genre, bool nextPage = false}) async {
    final response =
        await _repository.featchGenrePageTv(genre: genre, nextPage: nextPage);

    if (nextPage) {
      tvPopular.addAll(response);
    } else {
      tvPopular = response;
    }
  }
}
