import 'package:consumindo_api/src/models/genre_tv.dart';
import 'package:consumindo_api/src/models/tv_popular.dart';
import 'package:flutter/material.dart';

import '../../models/genre.dart';
import '../../shared/utils/app_colors.dart';

class CardItemTv extends StatelessWidget {
  final TvPopular tv;
  final List<GenreTv> genres;

  const CardItemTv({Key? key, required this.tv, required this.genres})
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
            'https://image.tmdb.org/t/p/w154/${tv.posterPath}',
          ),
          alignment: Alignment.topLeft,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/details_tv_page', arguments: tv.id);
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
                    tv.name!,
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
                        'Linguagem: ${tv.originalLanguage}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Gêneros: ${nameGeneresMovies(tv.genreIds!)}',
                        // '',
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
                    '${tv.voteAverage!}',
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
