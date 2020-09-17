import 'package:flutter/material.dart';
import 'package:onejain/ConstantValue.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  _launchURLMail(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: Text("Contact Us",
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
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _launchURLMail('Info@onejain.org', '', '');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/mail.png',
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                              child: Text(
                                "Info@onejain.org",
                                style: TextStyle(
                                    color: Color(0xffE31E24), fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL(ConstantValue.facebook);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/facebook.png',
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                              child: Text(
                                ConstantValue.facebook,
                                style: TextStyle(
                                    color: Color(0xff525F7F), fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL(ConstantValue.instagram);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/instagram.png',
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                              child: Text(
                                ConstantValue.instagram,
                                style: TextStyle(
                                    color: Color(0xff525F7F), fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL(ConstantValue.twitter);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/twitter.png',
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                              child: Text(
                                ConstantValue.twitter,
                                style: TextStyle(
                                    color: Color(0xff525F7F), fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL(
                          'https://www.youtube.com/channel/UC4r6qzRi0EAfves7CqvObgg/featured');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/youtube.png',
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                              child: Text(
                                "youtube.com/OneJain.org",
                                style: TextStyle(
                                    color: Color(0xffF5365C), fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL('https://www.onejain.org');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logo.jpeg',
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                              child: Text(
                                "www.onejain.org",
                                style: TextStyle(
                                    color: Color(0xffF5365C), fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _launchURL(var url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
