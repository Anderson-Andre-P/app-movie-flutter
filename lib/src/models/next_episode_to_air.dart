class NextEpisodeToAir {
  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  // Null? stillPath;
  double? voteAverage;
  int? voteCount;

  NextEpisodeToAir(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.runtime,
      this.seasonNumber,
      // this.stillPath,
      this.voteAverage,
      this.voteCount});

  factory NextEpisodeToAir.fromJson(Map<String, dynamic> json) {
    return NextEpisodeToAir(
      airDate: json['air_date'],
      episodeNumber: json['episode_number'],
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      productionCode: json['production_code'],
      runtime: json['runtime'],
      seasonNumber: json['season_number'],
      // stillPath: json['still_path'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['air_date'] = airDate;
    data['episode_number'] = episodeNumber;
    data['id'] = id;
    data['name'] = name;
    data['overview'] = overview;
    data['production_code'] = productionCode;
    data['runtime'] = runtime;
    data['season_number'] = seasonNumber;
    // data['still_path'] = stillPath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
