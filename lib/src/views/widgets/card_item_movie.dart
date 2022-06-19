import 'package:flutter/material.dart';

import '../../models/genre.dart';
import '../../models/movie.dart';
import '../../shared/utils/app_colors.dart';

class CardItemMovie extends StatelessWidget {
  final Movie movie;
  final List<Genre> genres;

  const CardItemMovie({Key? key, required this.movie, required this.genres})
      : super(key: key);

  String nameGeneresMovies(List<int> listGenre) {
    String result = '';

    for (var element in listGenre) {
      result += result != '' ? ', ' : '';
      result += genres.firstWhere((e) => e.id == element).name!;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w154/${movie.posterPath}',
          ),
          alignment: Alignment.topLeft,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/details', arguments: movie.id);
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => DetailsMoviePage(
          //       idMovie: movie.id!,
          //     ),
          //   ),
          // );
        },
        child: Row(
          children: [
            const SizedBox(
              width: 135,
            ),
            // ClipRRect(
            //   borderRadius: const BorderRadius.horizontal(
            //     left: Radius.circular(20),
            //   ),
            //   child: Image.network(
            //     'https://image.tmdb.org/t/p/w154/${movies[index].posterPath}',
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Linguagem: ${movie.originalLanguage}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Gêneros: ${nameGeneresMovies(movie.genreIds!)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.whiteColor,
                  ),
                ),
                Container(
                  height: 30,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.rankColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '${movie.voteAverage!}',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
