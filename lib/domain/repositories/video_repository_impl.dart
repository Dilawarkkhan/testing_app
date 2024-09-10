import 'package:hive/hive.dart'; // Add Hive for caching
import 'package:tesing_app/data/datasources/remote_data_source.dart';
import '../../domain/entities/video.dart';
import '../../domain/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final RemoteDataSource remoteDataSource;
  final Box videoBox = Hive.box('videoBox'); // Hive box for storing video data

  VideoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Video>> getVideos(int page, int limit, String country) async {
    try {
      // Fetch videos from API
      final videos = await remoteDataSource.fetchVideos(page, limit, country);

      // Save each video to cache
      for (var video in videos) {
        videoBox.put(video.id, video); // Cache each video by ID
      }

      return videos;
    } catch (e) {
      // In case of error, attempt to retrieve videos from cache
      final cachedVideos = videoBox.values.toList();
      if (cachedVideos.isNotEmpty) {
        return List<Video>.from(cachedVideos);
      } else {
        throw Exception('Failed to load videos and no cached data available.');
      }
    }
  }
}
