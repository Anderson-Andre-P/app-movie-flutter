import 'package:consumindo_api/src/models/genre_tv.dart';
import 'package:consumindo_api/src/repositories/genre_tv_repository.dart';

class GenreTvController {
  final GenreTvRepository _repository;

  GenreTvController(this._repository);

  List<GenreTv> genresTv = <GenreTv>[];

  Future<void> getGenreTv() async {
    genresTv = await _repository.featchGenreTv();
  }
}
