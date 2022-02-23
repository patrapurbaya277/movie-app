class TvShow {
  TvShow({
    required this.backdropPath,
    // required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  String backdropPath;
  DateTime? firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;

  factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        backdropPath: json["backdrop_path"] ?? "",
        // firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity:
            json["popularity"] != null ? json["popularity"].toDouble() : 0.0,
        posterPath: json["poster_path"]==null?"":"https://image.tmdb.org/t/p/w500/" + json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        // "first_air_date":
        //     "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "name": name,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class TvShowDetailsClass {
  TvShowDetailsClass({
    this.adult,
    this.backdropPath,
    // this.createdBy,
    // this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    // this.homepage,
    this.id,
    // this.inProduction,
    this.languages,
    this.lastAirDate,
    // this.lastEpisodeToAir,
    this.name,
    // this.nextEpisodeToAir,
    // this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    // this.productionCompanies,
    // this.productionCountries,
    // this.seasons,
    // this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  // List<CreatedBy> createdBy;
  // List<int> episodeRunTime;
  DateTime? firstAirDate;
  List<String>? genres;
  // String homepage;
  int? id;
  // bool inProduction;
  List<String>? languages;
  DateTime? lastAirDate;
  // LastEpisodeToAir lastEpisodeToAir;
  String? name;
  // dynamic nextEpisodeToAir;
  // List<Network> networks;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  // List<Network> productionCompanies;
  // List<ProductionCountry> productionCountries;
  // List<Season> seasons;
  // List<SpokenLanguage> spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  factory TvShowDetailsClass.fromJson(Map<String, dynamic> json) =>
      TvShowDetailsClass(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        // createdBy: List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
        // episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genres: List<String>.from(json["genres"].map((x) => x["name"])),
        // homepage: json["homepage"],
        id: json["id"],
        // inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        // lastEpisodeToAir: LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        // nextEpisodeToAir: json["next_episode_to_air"],
        // networks: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"]==null?"":"https://image.tmdb.org/t/p/w500/"+json["poster_path"],
        // productionCompanies: List<Network>.from(json["production_companies"].map((x) => Network.fromJson(x))),
        // productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        // seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
        // spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}
