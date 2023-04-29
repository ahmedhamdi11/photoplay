import 'package:equatable/equatable.dart';

class CastModel extends Equatable {
  final int id;
  final String name;
  final String? profilePath;
  const CastModel({
    required this.id,
    required this.name,
    required this.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> jsonData) {
    return CastModel(
      id: jsonData['id'],
      name: jsonData['name'],
      profilePath: jsonData['profile_path'] ?? '',
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        profilePath,
      ];
}
