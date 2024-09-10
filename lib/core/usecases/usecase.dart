import 'package:tesing_app/domain/entities/video.dart';
import 'package:tesing_app/domain/repositories/video_repository.dart';

class GetVideos {
  final VideoRepository repository;

  GetVideos({required this.repository});

  Future<List<Video>> call(int page, int limit, String country) {
    return repository.getVideos(page, limit, country);
  }
}
