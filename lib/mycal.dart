import 'package:flutter/material.dart';
import 'package:loading_placeholder/loading_placeholder.dart';
import 'package:mahar_bote_flutter/bodycho.dart';
import 'package:mahar_bote_flutter/calculation/jdn.dart';
import 'package:mahar_bote_flutter/calculation/salay.dart';
import 'package:mahar_bote_flutter/constant.dart';
import 'package:mahar_bote_flutter/custom_top_bar.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:timer_count_down/timer_count_down.dart';

class MyDbc extends StatefulWidget {
  int year;
  int month;
  int day;
  int hours;
  MyDbc(
      {Key key,
      @required this.hours,
      @required this.day,
      @required this.month,
      @required this.year})
      : super(key: key);

  @override
  _MyDbcState createState() => _MyDbcState();
}

class _MyDbcState extends State<MyDbc> {
  bool _showTimer = true;
  int _seconds = 2;

  @override
  Widget build(BuildContext context) {
    JdnCal jdncal = JdnCal.clickjdn(widget.day, widget.month, widget.year);
    return Container(
        child: Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: 'topBarBtn',
                        child: Card(
                          elevation: 4,
                          shape: kBackButtonShape,
                          child: MaterialButton(
                            height: 50,
                            minWidth: 50,
                            elevation: 10,
                            shape: kBackButtonShape,
                            // onPressed: onPressed,
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: InkWell(
                          //
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  "ထီဗေဒင်..",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    // color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Card(
              elevation: 2,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                color: Colors.white54,
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    MyMMdata("မိမိမွေးသက္က၇ဇ် - ", jdncal.jdntommyear()),
                    MyMMdata("မိမိမွေးနံ  - ",
                        jdncal.jdntommday(widget.hours.toString())),
                    MyMMdata(
                        "မိမိ အဖွား - ",
                        mYbdnb(jdncal.jdntommyear(),
                            jdncal.jdntommdayno(widget.hours.toString()))),
                    MyMMdata(
                        "မိမိ အသက် - ", agecalulate(widget.year).toString()),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                color: Colors.white60,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    MyMMdata("ယခု သာသနာ သက္က၇ာဇ် - ", jdncal.jdntommBuddsh()),
                    MyMMdata("ယခု သာသနာ သက္က၇ာဇ် - ", jdncal.jdntommBuddsh()),
                  ],
                ),
              ),
            ),
            if (_showTimer)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" တွက်ချက်နေပါသည်.. ခနစောင့်ပါ... "),
                    CountDown(
                      seconds: _seconds,
                      onTimer: () {
                        setState(() {
                          _showTimer = false;
                        });
                      },
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            if (!_showTimer)
              Card(
                elevation: 2,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  color: Colors.grey,
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          SaLay(
                              agecalulate(widget.year),
                              int.parse(
                                  jdncal.jdntommdayno(widget.hours.toString())),
                              int.parse(jdncal.jdntommyear())),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    ));
  }

  int agecalulate(int mybdyear) {
    int now = new DateTime.now().year;
    int myage = now - mybdyear;
    return myage;
  }

  MyMMdata(String name, String cal) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: <Widget>[
          Container(
              width: 150,
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Text(
            cal,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  String mYbdnb(String mmyear, String mmdayno) {
    int mmyea = int.parse(mmyear);
    int mmdayn = int.parse(mmyear);
    int mmbd = mmyea % 7;
    // if (mmbd == 0) {
    //   mmbd = 7;
    // }else{

    // }
    String mmybd = "";
    if (mmbd == mmdayn) {
      mmybd = " ဘင်္ကဖွား";
      print(mmybd);
    } else if (mmbd == mmdayn + 3 || mmbd == mmdayn - 4) {
      mmybd = " အဓိပတိ ဖွား";
      print(mmybd);
    } else if (mmbd == mmdayn + 6 || mmbd == mmdayn - 1) {
      mmybd = " ပုတိ ဖွား";
      print(mmybd);
    } else if (mmbd == mmdayn + 2 || mmbd == mmdayn - 5) {
      mmybd = " ၇ာဇ ဖွား";
      print(mmybd);
    } else if (mmbd == mmdayn + 5 || mmbd == mmdayn - 2) {
      mmybd = " သိုက် ဖွား";
      print(mmybd);
    } else if (mmbd == mmdayn + 1 || mmbd == mmdayn - 6) {
      mmybd = " အထွန်း ဖွား";
      print(mmybd);
    } else if (mmbd == mmdayn + 4 || mmbd == mmdayn - 3) {
      mmybd = " မ၇ဏ";
      print(mmybd);
    }
    return mmybd;
  }
}
