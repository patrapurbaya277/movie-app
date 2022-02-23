class SavedMovie {
    SavedMovie({
        required this.id,
        required this.image,
    });

    int id;
    String image;

    factory SavedMovie.fromJson(Map<String, dynamic> json) => SavedMovie(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}