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
  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        color: Colors.white10,
      child: Column(
      
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                width: double.infinity,
              ),
              Container(
                height: 125.0,
                width: double.infinity,
                color: getColorFromHex("#069340"),
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
                            'https://zenprospect-production.s3.amazonaws.com/uploads/pictures/5c2fada0f651256d10f17beb/picture'),
                        fit: BoxFit.cover)),
              ),
            ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.all_inclusive),
                title: Text("hello"),
              )
            ],
          ),
          Card(
            elevation: 2 ,
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
