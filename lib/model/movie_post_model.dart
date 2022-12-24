class MoviePostModel {
  final String category;
  final String language;
  final String genre;
  final String sort;
  MoviePostModel({
    required this.category,
    required this.language,
    required this.genre,
    required this.sort,
  });

  Map<String, dynamic> toJson() {
    return {
      "category": category,
      'language': language,
      'genre': genre,
      'sort': sort,
    };
  }
}
