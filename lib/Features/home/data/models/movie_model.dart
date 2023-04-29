import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final dynamic voteAverage;
  final int voteCount;
  final List genreIds;

  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  factory MovieModel.fromJson(jsonData) {
    return MovieModel(
      id: jsonData['id'],
      title: jsonData['title'],
      overview: jsonData['overview'],
      posterPath: jsonData['poster_path'],
      backdropPath: jsonData['backdrop_path'],
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      genreIds: jsonData['genre_ids'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
