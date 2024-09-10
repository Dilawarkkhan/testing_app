import 'package:get_it/get_it.dart';
import 'package:tesing_app/data/repositories/video_repository_impl.dart';
import 'package:tesing_app/domain/repositories/video_repository.dart';

import 'data/datasources/remote_data_source.dart';
import 'domain/usecases/get_videos.dart';
import 'presentation/blocs/video_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => VideoBloc(sl())); // Pass positional argument

  // Use Cases
  sl.registerLazySingleton(() => GetVideos(repository: sl()));

  // Repository
  sl.registerLazySingleton<VideoRepository>(
    () => VideoRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );
}
