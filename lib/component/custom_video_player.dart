import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

// 동영상 위젯 생성
class CustomVideoPlayer extends StatefulWidget {

  // 선택한 동영상을 저장할 변수
  // XFile은 ImagePicker로 영상 또는 이미지를 선택했을 때 반환하는 타입
  final XFile video;

  const CustomVideoPlayer({
    required this.video, // 상위에서 선택한 동영상 주입해주기
    Key? key,
  }) : super(key: key);



  @override
  State<StatefulWidget> createState() => _CustomVideoPlayerState();

}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  //동영상을 조작하는 컨트롤러
  VideoPlayerController? videoPlayerController;
  @override
  void initState() {
    super.initState();

    initializeController();
  }

  initializeController() async {

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'CustomVideoPlayer', //샘플 텍스트
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}