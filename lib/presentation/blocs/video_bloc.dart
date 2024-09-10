import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_videos.dart';
import '../../domain/entities/video.dart';

abstract class VideoEvent {}

class FetchVideos extends VideoEvent {
  final int page;
  final int limit;
  final String country;

  FetchVideos({required this.page, required this.limit, required this.country});
}

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final List<Video> videos;

  VideoLoaded(this.videos);
}

class VideoError extends VideoState {
  final String message;

  VideoError(this.message);
}

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetVideos getVideos;
  int page = 1;
  final int limit = 10;

  VideoBloc(this.getVideos) : super(VideoInitial()) {
    on<FetchVideos>((event, emit) async {
      emit(VideoLoading());
      try {
        final videos = await getVideos(event.page, event.limit, event.country);
        emit(VideoLoaded(videos));
      } catch (e) {
        emit(VideoError(e.toString()));
      }
    });
  }
}
