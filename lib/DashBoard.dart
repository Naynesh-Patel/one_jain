import 'package:flutter/material.dart';
import 'package:onejain/AboutUs.dart';
import 'package:onejain/ContactUs.dart';
import 'package:onejain/Quotes.dart';
import 'package:onejain/Video.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      child: SafeArea(

        child: new Scaffold(

          body: Container(
            child:Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/logo.jpeg', alignment: Alignment.center,
                  height: 60,
                  width: 60,),
              ),
              new Container(
                // color: Colors.green,
                child: new SafeArea(
                  child: Column(
                    children: <Widget>[

                      TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.amber,
                        tabs: <Widget>[
                          Tab(
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0,
                                      right: 25.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Text("About Us",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16)),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0,
                                      right: 25.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Text("Videos",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16)),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0,
                                      right: 25.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Text("Contact Us",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16)),
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0,
                                      right: 25.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Text("Quotes",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  // controller: _tabController,
                    children: <Widget>[AboutUs(), Video(), ContactUs(), Quotes()]),
              ),
            ],)
          ),
        ),
      ),
    );
  }
}
