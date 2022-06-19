import 'package:consumindo_api/src/controllers/genre_controller.dart';
import 'package:consumindo_api/src/controllers/movie_controller.dart';
import 'package:consumindo_api/src/repositories/genre_repository.dart';
import 'package:consumindo_api/src/repositories/movie_repository.dart';
import 'package:consumindo_api/src/shared/infrastructure/dio_adapter.dart';
import 'package:consumindo_api/src/shared/utils/app_colors.dart';
import 'package:consumindo_api/src/views/widgets/card_genre.dart';
import 'package:flutter/material.dart';

import '../widgets/card_item_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieController controller = MovieController(MovieRepository(dio));
  GenreController controllerGenre = GenreController(GenreRepository(dio));

  int idGenre = 0;
  int lengthMovie = 0;

  bool loading = true;

  void alterLoading(bool value) => setState(() => loading = value);

  @override
  void initState() {
    super.initState();
    controllerGenre.getGenre().then(
          (listGenres) => controller.getGenreMovies().then(
                (listMovie) => alterLoading(false),
              ),
        );
  }

  @override
  Widget build(BuildContext context) {
    lengthMovie = controller.movies.length;
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.ballot_outlined),
          SizedBox(width: 10),
        ],
      ),
      drawer: const Drawer(),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controllerGenre.genres.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return CardGenre(
                          clickedButton: idGenre == 0,
                          name: 'Todos',
                          onTap: () {
                            alterLoading(true);
                            controller.getGenreMovies().then((listMovie) {
                              setState(
                                () => idGenre = 0,
                              );
                              alterLoading(false);
                            });
                          },
                        );
                      } else {
                        var item = controllerGenre.genres.elementAt(index - 1);
                        return CardGenre(
                          clickedButton: idGenre == item.id!,
                          name: item.name!,
                          onTap: () {
                            alterLoading(true);
                            controller
                                .getGenreMovies(genre: '${item.id}')
                                .then((listMovie) {
                              setState(
                                () => idGenre = item.id!,
                              );
                              alterLoading(false);
                            });
                          },
                        );
                      }
                      // Text(genres.elementAt(index).name!,
                      //     style: TextStyle(color: AppColors.whiteColor));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: loading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.whiteColor,
                    ),
                  )
                : controller.movies.isEmpty
                    ? Center(
                        child: Text(
                          'Categoria não possui filmes',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.movies.length,
                        itemBuilder: (context, index) {
                          if (index == (lengthMovie - 8)) {
                            var genre = idGenre != 0 ? idGenre : null;
                            controller
                                .getGenreMovies(genre: '$genre', nextPage: true)
                                .then((value) => setState(() {}));
                          }
                          return CardItemMovie(
                            movie: controller.movies[index],
                            genres: controllerGenre.genres,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
