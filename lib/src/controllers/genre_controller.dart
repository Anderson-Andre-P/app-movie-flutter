import 'package:consumindo_api/src/models/genre.dart';
import 'package:consumindo_api/src/repositories/genre_repository.dart';

class GenreController {
  final GenreRepository repository;
  List<Genre> genres = <Genre>[];
  GenreController(this.repository);

  Future<void> getGenre() async => genres = await repository.featchGenre();
}
