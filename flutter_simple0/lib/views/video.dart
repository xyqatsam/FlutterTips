import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController _controller;
  bool _isPlaying = false;
  final String url = 'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4';
  final String rtsp = 'rtsp://admin:12345678q@192.168.88.164:554/Stream/Channels/001';
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(this.rtsp)
    ..addListener((){
      final bool isPlaying =_controller.value.isPlaying;
      if (isPlaying !=_isPlaying) {
        setState(() {
         _isPlaying =isPlaying; 
        });
      }
    })
    // 在初始化完成后必须更新界面
    ..initialize().then((_){
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
         // Do somthing 
         if (!_isPlaying) {
           _controller.play();
         }
        });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('官方video_player plugin, native端使用的时ExoPlayer 注意引入时Android平台需开启Java8支持'),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: _buildVideo(),
       
        )
      ],
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildVideo() {
    return _controller.value.initialized
        ? AspectRatio(
          
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
        : Container();
  }
}