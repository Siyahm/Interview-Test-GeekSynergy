class AllMovies {
  AllMovies({
    required this.result,
  });

  List<Result> result;

  factory AllMovies.fromJson(Map<String, dynamic> json) => AllMovies(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    required this.director,
    required this.writers,
    required this.releasedDate,
    required this.productionCompany,
    required this.title,
    required this.language,
    required this.runTime,
    required this.genre,
    required this.poster,
    required this.pageViews,
    required this.description,
    required this.totalVoted,
    required this.star,
  });

  List<String>? director;
  List<String>? star;
  List<String>? writers;
  int? releasedDate;
  List<String>? productionCompany;
  String? title;
  String? language;
  dynamic runTime;
  String? genre;
  String? poster;
  int? pageViews;
  String? description;
  int? totalVoted;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        director: List<String>.from(json["director"].map((x) => x)),
        star: List<String>.from(json["stars"].map((x) => x)),
        writers: List<String>.from(json["writers"].map((x) => x)),
        releasedDate: json["releasedDate"],
        productionCompany:
            List<String>.from(json["productionCompany"].map((x) => x)),
        title: json["title"],
        language: json["language"],
        runTime: json["runTime"],
        genre: json["genre"],
        poster: json["poster"],
        pageViews: json["pageViews"],
        description: json["description"],
        totalVoted: json["totalVoted"],
      );
}
