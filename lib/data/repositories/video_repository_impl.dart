import '../../domain/entities/video.dart';
import '../../domain/repositories/video_repository.dart';
import '../datasources/remote_data_source.dart';

class VideoRepositoryImpl implements VideoRepository {
  final RemoteDataSource remoteDataSource;

  VideoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Video>> getVideos(int page, int limit, String country) async {
    return await remoteDataSource.fetchVideos(page, limit, country);
  }
}
