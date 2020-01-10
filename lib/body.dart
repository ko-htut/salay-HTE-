import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mahar_bote_flutter/calculation/jdn.dart';
import 'package:mahar_bote_flutter/calculation/salay.dart';
import 'package:mahar_bote_flutter/custom_top_bar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyBody extends StatefulWidget {
  MyBody({Key key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

int day;
int year;
int month;
int ampmtime;
int time;
String mmday = "0";
String mmdayno = "0";
String mmyear = "0";
String mmbdy = "0";
int abb = (7 % 4);

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(title: "Mahar Bote", child: Icon(Icons.camera_front)),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text("ဗေဒင် တွက်မယ်"),
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1000, 3, 5),
                    maxTime: DateTime(2020, 6, 7), onChanged: (date) {
                  //print("$date");
                }, onConfirm: (date) async {
                  day = date.day;
                  month = date.month;
                  year = date.year;
                  JdnCal jdncal = JdnCal.clickjdn(day, month, year);
                  print(jdncal.mmexday().toString());
                  setState(() {
                    mmyear = jdncal.jdntommyear();
                    mmbdy = jdncal.jdntommBuddsh();
                  });
                  DatePicker.showTimePicker(context,
                      showTitleActions: true,
                      onChanged: (timer) {}, onConfirm: (timer) {
                    setState(() {
                      ampmtime = timer.hour;
                      mmday = jdncal.jdntommday(ampmtime.toString());
                      mmdayno = jdncal.jdntommdayno(ampmtime.toString());
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
            ),
          ),
          Card(
              child: Column(
            children: <Widget>[
              MdataUser("မြန်မာ မွေးသက္က၇ဇ်", mmyear),
              MdataUser("သာသနာ သက္က၇ဇ်", mmbdy),
              MdataUser("နေ့ နံ", mmday),
              MdataUser("အသက် ", agecalulate(year).toString()),
            ],
          )),
          Card(
            child: Column(
              children: <Widget>[
                MdataThy(
                    "ထီပေါက်မည်လား ? -",
                    SaLay(agecalulate(year), int.parse(mmdayno),
                        int.parse(mmyear)))
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text(
                      "စလေဦးပုည ၏ ထီ ပေါက်ကိန်းတွက်နည်းကို အခြေခံ၍၇ေးသားထားပါသည်... "),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  MdataUser(String infousr, String mmdata) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[Text(infousr), Text("-"), Text(mmdata)],
      ),
    );
  }
MdataThy(String infotxt, String infothy) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[ Text(infotxt), Text(infothy)],
        ),
      ),
    );
  }
  int agecalulate(int mybdyear) {
    int now = new DateTime.now().year;

    if (mybdyear != null) {
      print(now);
      int myage = now - mybdyear;
      return myage;
    }
    return 0;
  }
}
