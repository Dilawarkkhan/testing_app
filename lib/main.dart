import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Add Hive for caching
import 'presentation/pages/reels_page.dart';
import 'presentation/blocs/video_bloc.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/video_repository_impl.dart';
import 'domain/usecases/get_videos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Open a box for video data (used for caching)
  await Hive.openBox('videoBox');

  // Dependency injection setup
  final remoteDataSource = RemoteDataSourceImpl();
  final videoRepository =
      VideoRepositoryImpl(remoteDataSource: remoteDataSource);
  final getVideos = GetVideos(repository: videoRepository);

  runApp(MyApp(getVideos: getVideos));
}

class MyApp extends StatelessWidget {
  final GetVideos getVideos;

  const MyApp({Key? key, required this.getVideos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoBloc(getVideos)
        ..add(FetchVideos(page: 1, limit: 10, country: 'United States')),
      child: MaterialApp(
        title: 'Reels App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const ReelsPage(),
      ),
    );
  }
}
