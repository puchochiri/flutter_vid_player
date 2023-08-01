import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_vid_player/component/custom_video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      // 동영상이 선택됐을 때와 선택 안 됐을 때 보여줄 위젯
      body: video== null ? renderEmpty() : renderVideo(),
    );
    // TODO: implement build
    throw UnimplementedError();
  } //동영상 저장할 변수


  Widget renderEmpty() { // 동영상을 선택 전 보여줄 위젯
      return Container(
        width: MediaQuery.of(context).size.width, // 넓이를 최대로 늘려주기
        decoration: getBoxDecoration(),
        child: Column(
          //위젯들 가운데 정렬
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Logo(
              onTap: onNewVideoPressed,
            ),  //로고 이미지
            SizedBox(height: 30.0),
            _AppName(), // 앱 이름
          ],
        ),
      );
  }

  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
    );
    if(video != null) {
      setState(() {
        this.video = video;
      });
    }
  }
  
  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      // 그라데이션으로 색상 적용하기
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors:  [
          Color(0xFF2A3A7C),
          Color(0xFF000118),
        ],
      ),
    );
  }

  Widget renderVideo() { // 동영상을 선택 후 보여줄 위젯
      return Center(
        child: CustomVideoPlayer(
          video: video!, // 선택된 동영상 입력해주시
        ),
      );
  }
  
}



// _HomeScreenState 클래스 아래에 추가
class _Logo extends StatelessWidget { //로고를 보여줄 위젯
  final GestureTapCallback onTap; //탭했을때 실행할 함수
  // _Logo(onTap, key) ==> class _Logo (String ontap, int key)
  const _Logo({
    required this.onTap,
    Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 상위 위젯으로 부터 탭 콜백받기
      child: Image.asset(
        'asset/img/logo.png',
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}

// _Logo 클래스 아래에 추가
class _AppName extends StatelessWidget { // 앱 제목을 보여줄 위젯
  const _AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w300,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, //글자 가운데 정렬
      children: [
        Text(
          'VIDEO',
          style: textStyle,
        ),
        Text(
          'PLAYER',
          style: textStyle.copyWith(
            // textStyle에서 두께만 700으로 변경
            fontWeight: FontWeight.w700,
          )
        )
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }


}