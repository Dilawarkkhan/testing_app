import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video_model.dart';

abstract class RemoteDataSource {
  Future<List<VideoModel>> fetchVideos(int page, int limit, String country);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const String baseUrl = 'https://api.ulearna.com/bytes/all';

  @override
  Future<List<VideoModel>> fetchVideos(
      int page, int limit, String country) async {
    final response = await http.get(
      Uri.parse('$baseUrl?page=$page&limit=$limit&country=$country'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> videoData = jsonData['data']['data'];

      return videoData.map((json) => VideoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
