import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presetation/widgets/shared/video_buttons.dart';
import 'package:toktik/presetation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos; 

  const VideoScrollableView({
    super.key, 
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical, // direcionamiento de deplazamineto de arriba a abajo
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length - 1, // permite ir de izquierda a derecha o de arriba a abajo (depende de scrollDirection) en cambio en la pantalla
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(videoURL: videoPost.videoUrl, caption: videoPost.caption),
            ),
            Positioned(
              bottom: 40,
              right: 20,  
              child: VideoButtons(video: videoPost), 
            ),
          ],
          // video player
          // Buttons
        );
      },
    );
  }
}