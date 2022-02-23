class Movie {
  
    Movie({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        // this.video,
        this.voteAverage,
        this.voteCount,
    });

    bool? adult;
    String? backdropPath;
    List<int>? genreIds;
    int? id;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    DateTime? releaseDate;
    String? title;
    // bool? video;
    double? voteAverage;
    int? voteCount;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"]??"",
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]!=null?json["popularity"].toDouble():0.0,
        posterPath: json["poster_path"]!=null?"https://image.tmdb.org/t/p/w500/"+json["poster_path"]:"",
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        // video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        // "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class MovieDetailClass {
    MovieDetailClass({
        this.adult,
         this.backdropPath,
        // this.belongsToCollection,
         this.budget,
         this.genres,
         this.homepage,
         this.id,
         this.imdbId,
         this.originalLanguage,
         this.originalTitle,
         this.overview,
         this.popularity,
         this.posterPath,
        // this.productionCompanies,
        // this.productionCountries,
         this.releaseDate,
         this.revenue,
         this.runtime,
        // this.spokenLanguages,
         this.status,
         this.tagline,
         this.title,
         this.video,
         this.voteAverage,
         this.voteCount,
    });

    bool? adult;
    String? backdropPath;
    // dynamic? belongsToCollection;
    int? budget;
    List<String>? genres;
    String? homepage;
    int? id;
    String? imdbId;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    // List<ProductionCompany> productionCompanies;
    // List<ProductionCountry> productionCountries;
    DateTime? releaseDate;
    int? revenue;
    int? runtime;
    // List<SpokenLanguage> spokenLanguages;
    String? status;
    String? tagline;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

    factory MovieDetailClass.fromJson(Map<String, dynamic> json) => MovieDetailClass(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        // belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<String>.from(json["genres"].map((x) => x["name"])),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"]==null?"":"https://image.tmdb.org/t/p/w500/"+json["poster_path"],
        // productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        // productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        // spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );
}
