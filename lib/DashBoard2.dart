import 'package:flutter/material.dart';
import 'package:onejain/AboutUs.dart';
import 'package:onejain/ContactUs.dart';
import 'package:onejain/Quotes.dart';
import 'package:onejain/Video.dart';

class DashBoard2 extends StatefulWidget {
  @override
  _DashBoard2State createState() => _DashBoard2State();
}

class _DashBoard2State extends State<DashBoard2> {
  int bottomSelectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void bottomTapped(int index) {
    print(index);
    setState(() {
      bottomSelectedIndex = index;
    });

    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              bottomTapped(index);
            },
            currentIndex: bottomSelectedIndex,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xffE31E24),
            unselectedItemColor: Color(0xff5E72E4),
//              unselectedItemColor: colorunSel,
//              selectedFontSize: FontSize.s12,
//              unselectedFontSize: FontSize.s12,

            elevation: 4,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/about_us.jpg',
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                ),
                activeIcon: Image.asset(
                  'assets/images/about_us_selected.png',
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                ),
                title: Text(""),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/video.jpeg',
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                ),
                activeIcon: Image.asset(
                  'assets/images/video_active.png',
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                ),
                title: Text(""),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/quotes.jpeg',
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                ),
                activeIcon: Image.asset(
                  'assets/images/quotes_active.png',
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                ),
                title: Text(""),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/contactus.jpeg',
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                ),
                activeIcon: Image.asset(
                  'assets/images/contactus_active.png',
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                ),
                title: Text(""),
                backgroundColor: Colors.white,
              ),
            ],
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (position) {
              setState(() {
                bottomSelectedIndex = position;
              });
            },
            children: <Widget>[AboutUs(), Video(), Quotes(), ContactUs()],
          )),
    );
  }
}
