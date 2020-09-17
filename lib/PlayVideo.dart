import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onejain/ModelVideo.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  ModelVideo modelVideo;

  PlayVideo.modelVideo(ModelVideo paramModelVideo) {
    modelVideo = paramModelVideo;
  }

  @override
  State<StatefulWidget> createState() {
    return _StatePlayVideo();
  }
}

class _StatePlayVideo extends State<PlayVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: Text("Play Video"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          YoutubePlayer(
            key: ObjectKey(widget.modelVideo.videoUrl),
            controller: YoutubePlayerController(
                initialVideoId: widget.modelVideo.videoUrl,
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                )),
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              widget.modelVideo.videoTitle,
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
