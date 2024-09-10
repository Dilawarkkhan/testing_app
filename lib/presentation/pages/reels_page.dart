import 'package:flutter/material.dart';
import 'package:tesing_app/presentation/widgets/video_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/video_bloc.dart'; // Assuming VideoBloc is already created
import '../../data/models/video_model.dart'; // Assuming this model exists

class ReelsPage extends StatefulWidget {
  const ReelsPage({Key? key}) : super(key: key);

  @override
  _ReelsPageState createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  late PageController _pageController; // Ensure this is a late variable
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the PageController
    _pageController = PageController();
  }

  @override
  void dispose() {
    // Dispose the PageController to prevent memory leaks
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VideoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is VideoLoaded) {
            final videos = state.videos;
            return PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: videos.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final video = videos[index];
                return VideoItem(video: video);
              },
            );
          } else if (state is VideoError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No Videos'));
        },
      ),
    );
  }
}

class ReelsList extends StatelessWidget {
  final List<VideoModel> videos;

  const ReelsList({Key? key, required this.videos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return VideoItem(video: video);
      },
    );
  }
}
