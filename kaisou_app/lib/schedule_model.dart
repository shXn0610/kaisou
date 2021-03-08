import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'schedule.dart';

class ScheduleModel extends ChangeNotifier {
  List<Schedule> scheduleList = [];

  Future getScheduleList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('schedules').get();
    final docs = snapshot.docs;
    final scheduleList = docs.map((doc) => Schedule(doc)).toList();
    this.scheduleList = scheduleList;
    notifyListeners();
  }
}
