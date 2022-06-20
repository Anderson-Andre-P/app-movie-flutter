import 'package:consumindo_api/src/controllers/details_controller.dart';
import 'package:consumindo_api/src/controllers/genre_controller.dart';

import 'package:consumindo_api/src/repositories/details_repository.dart';
import 'package:consumindo_api/src/repositories/genre_repository.dart';
import 'package:consumindo_api/src/shared/utils/app_colors.dart';

import 'package:flutter/material.dart';

import '../../shared/infrastructure/dio_adapter.dart';

class DetailsMoviePage extends StatefulWidget {
  final int idMovie;

  const DetailsMoviePage({Key? key, required this.idMovie}) : super(key: key);

  @override
  State<DetailsMoviePage> createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  DetailsController detailsController =
      DetailsController(DetailsRepository(dio));
  GenreController controllerGenre = GenreController(GenreRepository(dio));
  int idGenre = 0;
  @override
  void initState() {
    super.initState();
    controllerGenre.getGenre().then((value) => setState(() {}));
    detailsController
        .getDetails(idMovie: widget.idMovie)
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          tooltip: 'Voltar',
          onPressed: () {
            Navigator.pushNamed(context, '/');
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => HomePage(),
            //   ),
            // );
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  // child: Text('${detailsController.details.id}'),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          // 'https://api.themoviedb.org/3/movie/${detailsController.details.id}?api_key=acc4540ce8fb7311a346b6e342c86fd4&language=en-US/${detailsController.details.backdropPath}'
                          'https://image.tmdb.org/t/p/original/${detailsController.details.backdropPath}'
                          // 'https://image.tmdb.org/t/p/w154/${detailsController.details.backdropPath}',
                          ),
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: Text(
                    '${detailsController.details.originalTitle}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Row(
              children: [
                Container(
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/${detailsController.details.posterPath}',
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Título original:'),
                        Container(
                          width: 200,
                          child: Text(
                            '${detailsController.details.originalTitle}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            softWrap: false,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Popularidade: ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text('${detailsController.details.popularity}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Lançamento: ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text('${detailsController.details.releaseDate}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Média de votos: ",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text('${detailsController.details.voteAverage}'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      'Sinopse',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text('${detailsController.details.overview}')
                ],
              ),
            ),
            // Row(
            //   children: [
            //     SizedBox(
            //       height: 35,
            //       child: ListView.builder(
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         itemCount:
            //             detailsController.details.productionCountries.length,
            //         itemBuilder: (context, index) {
            //           return CardGenre(
            //             clickedButton: idGenre == 0,
            //             name:
            //                 '${detailsController.details.productionCountries}',
            //             onTap: () {},
            //           );
            //         },
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
