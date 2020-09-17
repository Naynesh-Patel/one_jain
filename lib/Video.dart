import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onejain/ConstantValue.dart';
import 'package:onejain/PlayVideo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

var isLoaded = false;

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  double aspectratio = 3.5 / 2;

  List<String> name = List<String>();

  List<YoutubePlayerController> _controllers = List<YoutubePlayerController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    /*for (var i = 0; i < ConstantValue.videos.length; i++) {
      name.add(ConstantValue.videos[i].videoTitle.toString());
      _controllers.add(YoutubePlayerController(
          initialVideoId: ConstantValue.videos[i].videoUrl,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          )));
    }*/
  }

  /*final List<String> name = [
    'Bhagawan Mahavir Draam',
    'Savantsari Drama',
    'JainAtva Drama',
    'Day 1 Morning',
    'Day 1 Night',
    'Day 2 Morning',
    'Day 3 Morning',
    'Day 4 Morning',
    'Day 4 Noon',
    'Day 4 Night',
    'Day 5 - Bhagwan Mahavir Janmotsav',
    'Day 5 Night',
    'Day 7 Noon',
    'Day 7 Night',
    'Day 8 Morning',
    'Paryushan Aalochana',
  ].toList();*/
/*

  final List<YoutubePlayerController> _controllers = [
    'T-hdL0CpB1k',
    'zdMDigMGDm0',
    'fDFsY-9PSN4',
    'D8g7vf2KdLY',
    '9m8AtqrqCK0',
    'jkUMvkDPLEQ',
    'agtTRsaK2Tk',
    '-7VKlk9OQ4U',
    'ygnP_cNthvs',
    'eb7Jw_lQBRE',
    'uzJiJ0TzIyM',
    'LWgliN87jBg',
    'E9lsMuxOpMA',
    '0eBZ4onyR_M',
    'BZJZB5kx5ts',
    '7JDkRChPx0A'
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Container(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  alignment: Alignment.center,
                  height: 70,
                  width: 70,
                ),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 10.0, bottom: 5.0),
                  child: Text("Videos",
                      style: TextStyle(
                          color: Color(0xffE31E24),
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 60,
                  height: 2,
                  color: Color(0xffD78D36),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ConstantValue.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayVideo.modelVideo(
                                      ConstantValue.videos[index])));
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              ConstantValue.videos[index].videoTitle,
                              style: TextStyle(fontSize: 18),
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 16),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://img.youtube.com/vi/' +
                                        ConstantValue.videos[index].videoUrl +
                                        '/0.jpg',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      child: Center(
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      color: Colors.grey[100],
                                      child: Center(
                                        child: Icon(Icons.error_outline),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: Center(
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Color(0xffE31E24),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            /*Padding(
        padding: const EdgeInsets.fromLTRB(0.0,10,0,0),
        child: Image.asset('assets/images/img2.jpeg', alignment: Alignment.center,
          ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0,10,0,0),
        child: Image.asset('assets/images/img3.jpeg', alignment: Alignment.center,
          ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0,10,0,10),
        child: Image.asset('assets/images/img4.jpeg', alignment: Alignment.center,
          ),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0,10,0,10),
          child: Image.asset('assets/images/img5.jpeg', alignment: Alignment.center,
          ),
        ),*/
          ],
        ),
      ),
    )) /* Container(
      child: Column(children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.jpeg',
              alignment: Alignment.center,
              height: 70,
              width: 70,
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 10.0, bottom: 5.0),
              child: Text("Videos",
                  style: TextStyle(
                      color: Color(0xffE31E24),
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 60,
              height: 2,
              color: Color(0xffD78D36),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: ConstantValue.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left: 8, right: 8, bottom: 16),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayVideo.modelVideo(
                                      ConstantValue.videos[index])));
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              ConstantValue.videos[index].videoTitle,
                              style: TextStyle(fontSize: 18),
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://img.youtube.com/vi/' +
                                        ConstantValue.videos[index].videoUrl +
                                        '/0.jpg',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.red,
                                            BlendMode.colorBurn,
                                          ),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      child: Center(
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      color: Colors.grey[100],
                                      child: Center(
                                        child: Icon(Icons.error_outline),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    child: Center(
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }) */ /*ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      name[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  YoutubePlayer(
                    key: ObjectKey(_controllers[index]),
                    controller: _controllers[index],
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
                ],
              );
            },
            itemCount: _controllers.length,
            separatorBuilder: (context, _) => const SizedBox(height: 10.0),
          ),*/ /*
            ),
      ]),
    )*/
        ;
  }
}
