import 'package:tesing_app/data/repositories/video_repository_impl.dart';

import '../entities/video.dart';
import '../repositories/video_repository.dart';

class GetVideos {
  final VideoRepository repository;

  // Constructor with a named parameter
  GetVideos({required this.repository});

  Future<List<Video>> call(int page, int limit, String country) async {
    return await repository.getVideos(page, limit, country);
  }
}
