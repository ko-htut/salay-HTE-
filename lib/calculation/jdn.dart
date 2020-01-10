class JdnCal {
  int _day;
  int _month;
  int _year;
  int jdn;
  var my;
  int jdnda;
  int _hours;
  int mmdateno;
  JdnCal.clickjdn(this._day, this._month, this._year) {
    int a = (14 - _month) ~/ 12;
    int y = _year + 4800 - a;
    int m = _month + (12 * a) - 3;
    jdn = _day +
        (((153 * m) + 2) ~/ 5) +
        (365 * y) +
        (y ~/ 4) -
        (y ~/ 100) +
        (y ~/ 400) -
        32045;
    print(jdn.toString());
  }
  String jdntommday(String hours) {
    jdnda = (jdn + 2) % 7;
    String mmdate;
    switch (jdnda) {
      case 0:
        mmdate = "စနေ";
        break;
      case 1:
        mmdate = "တနင်္ဂနွေ";
        break;
      case 2:
        mmdate = "တနင်္လာ";
        break;
      case 3:
        mmdate = "စနေ";
        break;
      case 4:
      if (int.parse(hours) <= 12) {
        mmdate = "ဗုဒ္ဓဟူး";
      } 
        mmdate = "၇ာဟု";
        break;
      case 5:
        mmdate = "ကြာသပတေး";
        break;
      case 6:
        mmdate = "သောကြာ";
        break;
      default:
      //  print("Invalid choice $jdnda");

        break;
    }
    return mmdate;
 
  }

  String jdntommdayno(String hours) {
    jdntommday(hours);

    switch (jdnda) {
      case 4:
        if (int.parse(hours) <= 12) {
          mmdateno = 4;
        } 
        mmdateno =7;
        break;
      default:
      mmdateno= jdnda;
    }
    return mmdateno.toString();
  }

  String jdntommyear() {
    my = (((jdn - 0.5 - 1954168.0506) * 4320000) ~/ 1577917828);
    return my.toString();
  }

  String jdntommBuddsh() {
    final mmbd = my + 1182;
    return mmbd.toString();
  }

  int mmexday() {
    jdntommyear();
    var lm = 1577917828 ~/ 53433336;
    var sy = 157791828 ~/ 4320000;
    var ed = ((sy * (my + 3739)) % lm);
    //print(ed);
    return int.parse("$ed");
  }

  int mmmthco() {
    mmexday();
  }
}
