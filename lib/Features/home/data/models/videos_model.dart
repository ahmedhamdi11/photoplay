import 'package:equatable/equatable.dart';

class VideosModel extends Equatable {
  final String videoKey;
  final String site;
  final String type;

  const VideosModel({
    required this.videoKey,
    required this.site,
    required this.type,
  });

  factory VideosModel.fromJson(Map<String, dynamic> jsonData) {
    return VideosModel(
      videoKey: jsonData['key'],
      site: jsonData['site'],
      type: jsonData['type'],
    );
  }
  @override
  List<Object?> get props => [
        videoKey,
        site,
        type,
      ];
}
