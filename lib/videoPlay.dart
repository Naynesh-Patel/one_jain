import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlay extends StatefulWidget {
  String id;

  VideoPlay(this.id);

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  @override
  void initState() {
    super.initState();
//    YoutubePlayerController _controller = YoutubePlayerController(
//      initialVideoId: 'iLnmTe5Q2Qw',
//      flags: YoutubePLayerFlags(
//        isLive: true,
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
//                key: ObjectKey(_controllers[index]),
//                controller: _controllers[index],
                actionsPadding: const EdgeInsets.only(left: 16.0),
                bottomActions: [
                  CurrentPosition(),
                  const SizedBox(width: 10.0),
                  ProgressBar(isExpanded: true),
                  const SizedBox(width: 10.0),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Text(name[index],style: TextStyle(fontSize: 18),),
//              ),
            ],
          );
        },
//        itemCount: _controllers.length,
        separatorBuilder: (context, _) => const SizedBox(height: 10.0),
      ),
    );
  }
}
