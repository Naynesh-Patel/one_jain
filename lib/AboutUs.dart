import 'package:flutter/material.dart';
import 'package:onejain/ConstantValue.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Text("About WeJain OneJain",
                        style: TextStyle(
                            color: Color(0xffE31E24),
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Container(width: 60, height: 3, color: Color(0xffD78D36)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ConstantValue.aboutUs.replaceAll("\\", "\n        "),
                  style: TextStyle(color: Color(0xffD78D36), fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
              )
              /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Parvadhiraj Paryushan Mahaparva is the most awaited occasion of the year. "
                "However, with the unprecedented COVID-19 situation, we are unable to be in the divine "
                "presence of Upashrays, Derasars and Dharmik institutions.",style: TextStyle(color: Color(0xffD78D36),fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("To ensure that not a single person remains deprived of "
                "Parmatma’s profound knowledge and the opportunity of cleansing"
                " their hearts, we feel blessed to invite you to be part of GLOBAL ONLINE PARYUSHAN MAHOTSAV AARADHANA."
                ,style: TextStyle(color: Color(0xffD78D36),fontSize:20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sanghs from India and across the world have pledged to join in virtually for "
                "this Paryushan Mahaparva Aaradhana.",style: TextStyle(color: Color(0xffD78D36),fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("There is social distancing, and yet, we are one",style: TextStyle(color: Color(0xffD78D36),fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Everyone is in their homes, and yet, there is unity in diversity",style: TextStyle(color: Color(0xffD78D36),fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Even in this Corona era, We Jains are One Jains!",style: TextStyle(color: Color(0xffD78D36),fontSize: 20)),
          ),*/
            ],
          ),
        ),
      ),
    );
  }
}
