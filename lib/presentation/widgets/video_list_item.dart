import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../domain/entities/video.dart';

class VideoItem extends StatefulWidget {
  final Video video;

  const VideoItem({Key? key, required this.video}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video.cdnUrl)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video Player Background
        _controller.value.isInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),

        // Gradient to highlight text at the bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Like, Comment, Share Buttons with Profile Image
        Positioned(
          right: 16,
          bottom: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Profile Image of Video Poster
              CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.video.userProfilePictureCdn),
                radius: 24,
              ),

              const SizedBox(height: 16),

              // Like Button with Animation
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                  size: 36,
                ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.video.totalLikes}',
                style: const TextStyle(color: Colors.white),
              ),

              // Comment Button
              const SizedBox(height: 16),
              IconButton(
                icon: const Icon(Icons.comment, color: Colors.white, size: 36),
                onPressed: () {
                  // Handle comment action
                },
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.video.totalComments}',
                style: const TextStyle(color: Colors.white),
              ),

              // Share Button
              const SizedBox(height: 16),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white, size: 36),
                onPressed: () {
                  // Handle share action
                },
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.video.totalShares}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),

        // Video Title, Views, and Other Info at the Bottom
        Positioned(
          left: 16,
          bottom: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width -
                    32, // Adjust width as needed
                child: Text(
                  widget.video.title,
                  maxLines: 1, // Limit to 1 line
                  overflow: TextOverflow
                      .ellipsis, // Show "..." when the text is too long
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${widget.video.totalViews} views',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.video.language ?? 'Unknown Language',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
