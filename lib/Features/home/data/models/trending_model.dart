import 'package:equatable/equatable.dart';

class TrendingModel extends Equatable {
  final int id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final dynamic voteAverage;
  final int voteCount;
  final List genreIds;
  final String mediaType;

  const TrendingModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.mediaType,
  });

  factory TrendingModel.fromJson(jsonData) {
    return TrendingModel(
      id: jsonData['id'],
      title: jsonData['title'] ?? jsonData['name'],
      overview: jsonData['overview'] ?? '-',
      posterPath: jsonData['poster_path'] ?? '',
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      genreIds: jsonData['genre_ids'],
      mediaType: jsonData['media_type'],
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
