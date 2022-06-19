import 'package:consumindo_api/src/models/movie.dart';
import 'package:consumindo_api/src/repositories/movie_repository.dart';

class MovieController {
  final MovieRepository repository;
  List<Movie> movies = <Movie>[];
  bool loading = false;

  MovieController(this.repository);

  Future<List<Movie>> getMovies() async {
    return await repository.featchMovie();
  }

  Future<void> getGenreMovies({String? genre, bool nextPage = false}) async {
    final results =
        await repository.featchGenrePageMovie(genre: genre, nextPage: nextPage);

    if (nextPage) {
      movies.addAll(results);
    } else {
      movies = results;
    }
    loading = !loading;
  }
}
