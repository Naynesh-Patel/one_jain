import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onejain/ConstantValue.dart';

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
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
                  child: Text("Quotes",
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
                itemCount: ConstantValue.images.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int position) {
                  return Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    width: double.infinity,
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.50),
                    child: CachedNetworkImage(
                      imageUrl: ConstantValue.images[position]
                          .replaceAll("[", "")
                          .replaceAll("]", "")
                          .replaceAll(" ", ""),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
//                        width: double.infinity,
//                        height: MediaQuery.of(context).size.height * 0.50,
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
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[100],
                        child: Center(
                          child: Icon(Icons.error_outline),
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
    ));
  }
}
