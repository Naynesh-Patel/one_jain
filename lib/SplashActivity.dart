import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onejain/ConstantValue.dart';
import 'package:onejain/ModelVideo.dart';

import 'DashBoard2.dart';

class SplashActivity extends StatefulWidget {
  @override
  _SplashActivityState createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  var isLoading = true;
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    getDateFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.jpeg',
                alignment: Alignment.center,
                height: 180,
                width: 180,
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: isLoading
                    ? CircularProgressIndicator(
                        strokeWidth: 2,
                      )
                    : Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            getDateFromFirebase();
                          },
                          child: Icon(
                            Icons.refresh,
                            size: 30,
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getDateFromFirebase() async {
    setState(() {
      isLoading = true;
    });
    var data = await Firestore.instance.collection("onejain").get();

    if (data.docs.length > 0) {
      var mapAboutUs = data.docs[0].data();
      var mapFacebook = data.docs[1].data();
      var mapImages = data.docs[2].data();
      var mapInstagram = data.docs[3].data();
      var mapTwitter = data.docs[4].data();
      var mapVideos = data.docs[5].data();
      var videos = mapVideos['list'];
      ConstantValue.images = mapImages['imageList'].toString().split(",");
      ConstantValue.aboutUs = mapAboutUs['about_us'];
      ConstantValue.facebook = mapFacebook['facebook'];
//      ConstantValue.telegram = mapTelegram['telegram'];
      ConstantValue.instagram = mapInstagram['instagram'];
      ConstantValue.twitter = mapTwitter['twitter'];
      var arrModelVideo = List<ModelVideo>();
      for (var i = 0; i < videos.length; i++) {
        var modelVideo = ModelVideo();
        modelVideo.show = videos[i]['show'];
        modelVideo.videoTitle = videos[i]['videoTitle'];
        modelVideo.videoUrl = videos[i]['videoUrl'];
        arrModelVideo.add(modelVideo);
      }
      ConstantValue.videos = arrModelVideo;
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard2()));
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  /* @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.jpeg', alignment: Alignment.center,
              height: 180,
              width: 180,),

            ],
          ),
        ),
      ),
    );
  }*/
}
