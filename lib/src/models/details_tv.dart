import 'package:consumindo_api/src/models/created_by.dart';
import 'package:consumindo_api/src/models/genre_tv.dart';
import 'package:consumindo_api/src/models/last_episode_to_air.dart';
import 'package:consumindo_api/src/models/networks.dart';
import 'package:consumindo_api/src/models/production_companies.dart';
import 'package:consumindo_api/src/models/production_countries.dart';
import 'package:consumindo_api/src/models/seasons.dart';
import 'package:consumindo_api/src/models/spoken_languages.dart';

class DetailsTv {
  bool? adult;
  // Null? backdropPath;
  List<CreatedBy>? createdBy;
  List<int>? episodeRunTime;
  String? firstAirDate;
  List<GenreTv>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  // Null? nextEpisodeToAir;
  List<Networks>? networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  // Null? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  List<Seasons>? seasons;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  DetailsTv(
      {this.adult,
      // this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      // this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      // this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.seasons,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount});

  factory DetailsTv.fromJson(Map<String, dynamic> json) {
    List<CreatedBy> createdBy = <CreatedBy>[];
    List<GenreTv> genres = <GenreTv>[];
    List<Networks> networks = <Networks>[];
    List<Seasons> seasons = <Seasons>[];
    List<SpokenLanguages> spokenLanguages = <SpokenLanguages>[];
    List<ProductionCompanies> productionCompanies = <ProductionCompanies>[];
    List<ProductionCountries> productionCountries = <ProductionCountries>[];

    if (json['created_by'] != null) {
      json['created_by'].forEach((v) {
        createdBy.add(CreatedBy.fromJson(v));
      });
    }

    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        genres.add(GenreTv.fromJson(v));
      });
    }

    if (json['networks'] != null) {
      json['networks'].forEach((v) {
        networks.add(Networks.fromJson(v));
      });
    }

    if (json['production_companies'] != null) {
      json['production_companies'].forEach((v) {
        productionCompanies.add(ProductionCompanies.fromJson(v));
      });
    }

    if (json['production_countries'] != null) {
      json['production_countries'].forEach((v) {
        productionCountries.add(ProductionCountries.fromJson(v));
      });
    }

    if (json['seasons'] != null) {
      json['seasons'].forEach((v) {
        seasons.add(Seasons.fromJson(v));
      });
    }

    if (json['spoken_languages'] != null) {
      json['spoken_languages'].forEach((v) {
        spokenLanguages.add(SpokenLanguages.fromJson(v));
      });
    }

    return DetailsTv(
      createdBy: createdBy,
      genres: genres,
      networks: networks,
      productionCompanies: productionCompanies,
      productionCountries: productionCountries,
      seasons: seasons,
      spokenLanguages: spokenLanguages,
      adult: json['adult'],
      // backdropPath : json['backdrop_path'],
      episodeRunTime: json['episode_run_time'].cast<int>(),
      firstAirDate: json['first_air_date'],
      homepage: json['homepage'],
      id: json['id'],
      inProduction: json['in_production'],
      languages: json['languages'].cast<String>(),
      lastAirDate: json['last_air_date'],
      lastEpisodeToAir: json['last_episode_to_air'] != null
          ? LastEpisodeToAir.fromJson(json['last_episode_to_air'])
          : null,
      name: json['name'],
      // nextEpisodeToAir = json['next_episode_to_air'],
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      originCountry: json['origin_country'].cast<String>(),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      // posterPath: json['poster_path'],
      status: json['status'],
      tagline: json['tagline'],
      type: json['type'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (createdBy != null) {
      data['created_by'] = createdBy!.map((v) => v.toJson()).toList();
    }

    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }

    if (lastEpisodeToAir != null) {
      data['last_episode_to_air'] = lastEpisodeToAir!.toJson();
    }

    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies!.map((v) => v.toJson()).toList();
    }

    if (productionCountries != null) {
      data['production_countries'] =
          productionCountries!.map((v) => v.toJson()).toList();
    }

    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }

    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }

    if (networks != null) {
      data['networks'] = networks!.map((v) => v.toJson()).toList();
    }

    data['adult'] = adult;
    // data['backdrop_path'] = backdropPath;
    data['episode_run_time'] = episodeRunTime;
    data['first_air_date'] = firstAirDate;
    data['homepage'] = homepage;
    data['id'] = id;
    data['in_production'] = inProduction;
    data['languages'] = languages;
    data['last_air_date'] = lastAirDate;
    data['name'] = name;
    // data['next_episode_to_air'] = nextEpisodeToAir;
    data['number_of_episodes'] = numberOfEpisodes;
    data['number_of_seasons'] = numberOfSeasons;
    data['origin_country'] = originCountry;
    data['original_language'] = originalLanguage;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['popularity'] = popularity;
    // data['poster_path'] = posterPath;
    data['status'] = status;
    data['tagline'] = tagline;
    data['type'] = type;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
