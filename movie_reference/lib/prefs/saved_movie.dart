class SavedMovie {
    SavedMovie({
         this.id,
         this.image,
         this.type,
    });

    String? id;
    String? image;
    String? type;

    factory SavedMovie.fromJson(Map<String, dynamic> json) => SavedMovie(
        id: json["id"],
        image: json["image"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "type": type
    };
}