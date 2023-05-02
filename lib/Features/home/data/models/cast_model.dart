import 'package:equatable/equatable.dart';

class CastModel extends Equatable {
  final int id;
  final String name;
  final String? profilePath;
  final String? biography;
  const CastModel({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.biography,
  });

  factory CastModel.fromJson(Map<String, dynamic> jsonData) {
    return CastModel(
      id: jsonData['id'],
      name: jsonData['name'],
      profilePath: jsonData['profile_path'] ?? '',
      biography: jsonData['biography'],
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        profilePath,
      ];
}
