import '../entities/video.dart';

abstract class VideoRepository {
  Future<List<Video>> getVideos(int page, int limit, String country);
}
