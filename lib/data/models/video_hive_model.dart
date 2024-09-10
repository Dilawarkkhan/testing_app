import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class HiveVideoModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String cdnUrl;

  @HiveField(3)
  final String thumbCdnUrl;

  @HiveField(4)
  final int totalViews;

  @HiveField(5)
  final int totalLikes;

  @HiveField(6)
  final int totalComments;

  @HiveField(7)
  final int totalShares;

  @HiveField(8)
  final int duration;

  @HiveField(9)
  final String byteAddedOn;

  @HiveField(10)
  final String? language;

  @HiveField(11)
  final String videoAspectRatio;

  HiveVideoModel({
    required this.id,
    required this.title,
    required this.cdnUrl,
    required this.thumbCdnUrl,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShares,
    required this.duration,
    required this.byteAddedOn,
    this.language,
    required this.videoAspectRatio,
  });
}
