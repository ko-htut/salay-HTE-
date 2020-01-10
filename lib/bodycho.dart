import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mahar_bote_flutter/calculation/jdn.dart';
import 'package:mahar_bote_flutter/mycal.dart';

class BodyCho extends StatefulWidget {
  BodyCho({Key key}) : super(key: key);

  @override
  _BodyChoState createState() => _BodyChoState();
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

class _BodyChoState extends State<BodyCho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: ListTile(
                leading: Icon(Icons.adjust),
                title: Text("ထီပေါက်ကိန်း တွက်မည်...."),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1900, 3, 5),
                      maxTime: DateTime.now(),
                      onChanged: (date) {}, onConfirm: (date) async {
                    DatePicker.showTimePicker(context,
                        showTitleActions: true,
                        onChanged: (timer) {}, onConfirm: (timer) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MyDbc(
                                hours: timer.hour,
                                day: date.day,
                                month: date.month,
                                year: date.year,
                              )));
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                }),
          )
        ],
      ),
    ));
    
  }
}
