import 'package:flutter_test/flutter_test.dart';
import 'package:tesing_app/main.dart';
import 'package:tesing_app/data/datasources/remote_data_source.dart';
import 'package:tesing_app/data/repositories/video_repository_impl.dart';
import 'package:tesing_app/domain/usecases/get_videos.dart';

void main() {
  testWidgets('Test with real API', (WidgetTester tester) async {
    // Create the real RemoteDataSource and VideoRepository
    final remoteDataSource = RemoteDataSourceImpl();
    final videoRepository =
        VideoRepositoryImpl(remoteDataSource: remoteDataSource);
    final getVideos = GetVideos(repository: videoRepository);

    // Pass the real GetVideos to the app
    await tester.pumpWidget(MyApp(getVideos: getVideos));

    // Perform any widget tests or API response verifications here
    expect(find.text('Reels'), findsOneWidget);
  });
}
