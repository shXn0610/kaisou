import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  Schedule(DocumentSnapshot doc) {
    this.strEvent = doc.data()['strEvent'];
    this.strYear = doc.data()['strYear'];
    this.strMonth = doc.data()['strMonth'];
    this.strDate = doc.data()['strDate'];
    this.strStartHour = doc.data()['strStartHour'];
    this.strStartMinute = doc.data()['strStartMinute'];
    this.strEndHour = doc.data()['strEndHour'];
    this.strEndMinute = doc.data()['strEndMinute'];
  }
  String strEvent;
  String strYear;
  String strMonth;
  String strDate;
  String strStartHour;
  String strStartMinute;
  String strEndHour;
  String strEndMinute;
}
