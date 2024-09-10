import '../../domain/entities/video.dart';

class VideoModel extends Video {
  @override
  final String userProfilePictureCdn;

  VideoModel({
    required int id,
    required String title,
    required String cdnUrl,
    required String thumbCdnUrl,
    required int totalViews,
    required int totalLikes,
    required int totalComments,
    required int totalShares,
    required int duration,
    required String byteAddedOn,
    required String? language,
    required String videoAspectRatio,
    required bool isLiked, // Add isLiked
    required this.userProfilePictureCdn, // Add this line
  }) : super(
          id: id,
          title: title,
          cdnUrl: cdnUrl,
          thumbCdnUrl: thumbCdnUrl,
          totalViews: totalViews,
          totalLikes: totalLikes,
          totalComments: totalComments,
          totalShares: totalShares,
          duration: duration,
          byteAddedOn: byteAddedOn,
          language: language,
          videoAspectRatio: videoAspectRatio,
          isLiked: isLiked, // Add isLiked
          userProfilePictureCdn: userProfilePictureCdn, // Include in super
        );

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['title'],
      cdnUrl: json['cdn_url'],
      thumbCdnUrl: json['thumb_cdn_url'],
      totalViews: json['total_views'],
      totalLikes: json['total_likes'],
      totalComments: json['total_comments'],
      totalShares: json['total_share'],
      duration: json['duration'],
      byteAddedOn: json['byte_added_on'],
      language: json['language'],
      videoAspectRatio: json['video_aspect_ratio'],
      isLiked: json['is_liked'] ?? false, // Fetch from API response
      userProfilePictureCdn: json['user']
          ['profile_picture_cdn'], // Extract user profile picture here
    );
  }
}
