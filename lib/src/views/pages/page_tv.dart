import 'package:consumindo_api/src/controllers/genre_controller.dart';
import 'package:consumindo_api/src/controllers/genre_tv_controller.dart';
import 'package:consumindo_api/src/controllers/movie_controller.dart';
import 'package:consumindo_api/src/controllers/tv_popular_controller.dart';
import 'package:consumindo_api/src/repositories/genre_repository.dart';
import 'package:consumindo_api/src/repositories/genre_tv_repository.dart';
import 'package:consumindo_api/src/repositories/movie_repository.dart';
import 'package:consumindo_api/src/repositories/tv_popular_repository.dart';
import 'package:consumindo_api/src/shared/infrastructure/dio_adapter.dart';
import 'package:consumindo_api/src/shared/utils/app_colors.dart';
import 'package:consumindo_api/src/views/widgets/card_genre.dart';
import 'package:consumindo_api/src/views/widgets/card_item_tv.dart';
import 'package:consumindo_api/src/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class PageTv extends StatefulWidget {
  const PageTv({Key? key}) : super(key: key);

  @override
  State<PageTv> createState() => _PageTvState();
}

class _PageTvState extends State<PageTv> {
  MovieController controller = MovieController(MovieRepository(dio));
  TvPopularController tvController =
      TvPopularController(TvPopularRepository(dio));
  // GenreController controllerGenre = GenreController(GenreRepository(dio));
  GenreTvController controllerGenreTv =
      GenreTvController(GenreTvRepository(dio));

  int idGenre = 0;
  int lengthMovie = 0;

  bool loading = true;

  void alterLoading(bool value) => setState(() => loading = value);

  @override
  void initState() {
    super.initState();
    controllerGenreTv.getGenreTv().then(
          (listGenres) => tvController.getTvPopular().then(
                (listMovie) => alterLoading(false),
              ),
        );
  }

  @override
  Widget build(BuildContext context) {
    lengthMovie = tvController.tvPopular.length;
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
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categorias de Tvs',
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
                    itemCount: controllerGenreTv.genresTv.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return CardGenre(
                          clickedButton: idGenre == 0,
                          name: 'Todos',
                          onTap: () {
                            alterLoading(true);
                            tvController.getGenrePageTv().then((listMovie) {
                              setState(
                                () => idGenre = 0,
                              );
                              alterLoading(false);
                            });
                          },
                        );
                      } else {
                        var item =
                            controllerGenreTv.genresTv.elementAt(index - 1);
                        return CardGenre(
                          clickedButton: idGenre == item.id!,
                          name: item.name!,
                          onTap: () {
                            alterLoading(true);
                            tvController
                                .getGenrePageTv(genre: '${item.id}')
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
                : tvController.tvPopular.isEmpty
                    ? Center(
                        child: Text(
                          'Categoria não possui Tvs',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      )
                    : ListView.builder(
                        itemCount: tvController.tvPopular.length,
                        itemBuilder: (context, index) {
                          if (index == (lengthMovie - 8)) {
                            var genre = idGenre != 0 ? idGenre : null;
                            controller
                                .getGenreMovies(genre: '$genre', nextPage: true)
                                .then((value) => setState(() {}));
                          }
                          return CardItemTv(
                            tv: tvController.tvPopular[index],
                            genres: controllerGenreTv.genresTv,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
