class MovieModel {
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final dynamic voteAverage;
  final int voteCount;
  final List genreIds;
  String? mediaType;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.mediaType,
  });

  factory MovieModel.fromJson(jsonData) {
    return MovieModel(
      id: jsonData['id'],
      title: jsonData['title'] ?? jsonData['name'] ?? '',
      overview: jsonData['overview'] ?? '-',
      posterPath: jsonData['poster_path'] ?? '',
      backdropPath: jsonData['backdrop_path'] ?? '',
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      genreIds: jsonData['genre_ids'],
      mediaType: jsonData['media_type'],
    );
  }
}
