import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  MyBody({Key key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: Center(
            child: Text(
          "Clover Private School",
          style: TextStyle(color: getColorFromHex("#069370")),
        )),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 350.0,
              width: double.infinity,
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              color: getColorFromHex("#069300"),
            ),
            Positioned(
              top: 125.0,
              left: 15.0,
              right: 15.0,
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(7.0),
                child: Container(
                  height: 220.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 75.0,
              left: (MediaQuery.of(context).size.width / 2 - 50.0),
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://scontent.frgn3-1.fna.fbcdn.net/v/t1.0-1/p320x320/78806100_153250519270326_3213288776163917824_o.jpg?_nc_cat=100&_nc_ohc=XcCNdmNq8xIAQltNEGzF0Zg-veesmq_p-pvPKaD4CgmlWErj7usAYfltQ&_nc_ht=scontent.frgn3-1.fna&oh=d0ab6898918152e16af5d3926d58683c&oe=5E67490D'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 190.0,
              left: (MediaQuery.of(context).size.width / 2) - 80.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Ko Htutz',
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'အတန်း - Gradde( 10 )',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'ဘာသာတွဲ - ( Ecology )',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'ကျောင်းဝင်နံပါတ် - 199',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            )
          ],
        ),
       
      ]),
    );
  }
}
