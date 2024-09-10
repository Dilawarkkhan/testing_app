class Video {
  final int id;
  final String title;
  final String cdnUrl;
  final String thumbCdnUrl;
  final int totalViews;
  final int totalLikes;
  final int totalComments;
  final int totalShares;
  final int duration;
  final String byteAddedOn;
  final String? language;
  final String videoAspectRatio;
  final bool isLiked; // Add isLiked field
  final String userProfilePictureCdn; // Add this field

  Video({
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
    required this.language,
    required this.videoAspectRatio,
    required this.isLiked, // Add isLiked in constructor
    required this.userProfilePictureCdn, // Add this to the constructor
  });
}
