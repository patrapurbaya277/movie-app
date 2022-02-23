import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/models/tv_show_model.dart';

class Person {
    Person({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownFor,
        required this.knownForDepartment,
        required this.name,
        required this.popularity,
        required this.profilePath,
    });

    bool adult;
    int gender;
    int id;
    List<dynamic> knownFor;
    String knownForDepartment;
    String name;
    double popularity;
    String profilePath;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownFor: List<dynamic>.from(json["known_for"].map((x) => x["media_type"]=="movie"?Movie.fromJson(x):TvShow.fromJson(x))),
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        profilePath: "https://image.tmdb.org/t/p/w500/"+json["profile_path"],
    );
}

class PersonDetailsClass {
    PersonDetailsClass({
        this.adult,
        this.alsoKnownAs,
        this.biography,
        this.birthday,
        this.deathday,
        this.gender,
        // this.homepage,
        this.id,
        // this.imdbId,
        this.knownForDepartment,
        this.name,
        this.placeOfBirth,
        this.popularity,
        this.profilePath,
    });

    bool? adult;
    List<String>? alsoKnownAs;
    String? biography;
    dynamic birthday;
    dynamic deathday;
    int? gender;
    // dynamic homepage;
    int? id;
    // String imdbId;
    String? knownForDepartment;
    String? name;
    String? placeOfBirth;
    double? popularity;
    String? profilePath;

    factory PersonDetailsClass.fromJson(Map<String, dynamic> json) => PersonDetailsClass(
        adult: json["adult"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: json["birthday"]!=null?DateTime.parse(json["birthday"]):null,
        deathday: json["deathday"]!=null?DateTime.parse(json["deathday"]):null,
        gender: json["gender"],
        // homepage: json["homepage"],
        id: json["id"],
        // imdbId: json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"].toDouble(),
        profilePath: "https://image.tmdb.org/t/p/w500/"+json["profile_path"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "also_known_as": List<dynamic>.from(alsoKnownAs!.map((x) => x)),
        "biography": biography,
        "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "deathday": deathday,
        "gender": gender,
        // "homepage": homepage,
        "id": id,
        // "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
    };
}
