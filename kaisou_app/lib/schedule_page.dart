import 'package:flutter/material.dart';
//import 'package:kaisou_app/page_route/fade_page_route.dart';
import 'package:kaisou_app/schedule.dart';
//import 'photo_page.dart';
import 'schedule_model.dart';
import 'package:provider/provider.dart';
import 'schedule_data_base.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage(this.strYear, this.strMonth, this.strDate);

  final String strYear;
  final String strMonth;
  final String strDate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ScheduleModel>(
        create: (_) => ScheduleModel()..getScheduleList(),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xFFFFFFFF),
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFF236AB1),
            child: Center(
              child: Consumer<ScheduleModel>(builder: (context, model, child) {
                final scheduleList = model.scheduleList;
                var scheduleDataBaseList = List<ScheduleDataBase>();
                scheduleDataBaseList = toScheduleDataBaseList(
                    strYear, strMonth, strDate, scheduleList);
                scheduleDataBaseList
                    .sort((a, b) => a.intTime.compareTo(b.intTime));
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        strYear + ' ' + strMonthName(strMonth) + ' ' + strDate,
                        style: TextStyle(
                          color: Color(0xFF15406A),
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 600,
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    for (int i = 0; i < 24; i++)
                                      Container(
                                        height: 90,
                                        width: 30,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              i.toString(),
                                              style: TextStyle(
                                                color: Color(0xFF15406A),
                                                fontSize: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 360,
                                      child: Column(
                                        children: <Widget>[
                                          if (scheduleDataBaseList.length == 0)
                                            SizedBox(height: 2160)
                                          else
                                            for (int i = 0;
                                                i < scheduleDataBaseList.length;
                                                i++)
                                              if (i == 0)
                                                Container(
                                                    child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height:
                                                          (scheduleDataBaseList[
                                                                      i]
                                                                  .intTime *
                                                              1.5),
                                                    ),
                                                    Container(
                                                      height: (scheduleDataBaseList[
                                                                      i + 1]
                                                                  .intTime -
                                                              scheduleDataBaseList[
                                                                      i]
                                                                  .intTime) *
                                                          1.5,
                                                      width: 360,
                                                      color: Color(0xFF15406A),
                                                      child: Text(
                                                        scheduleDataBaseList[i]
                                                            .strEvent,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF236AB1),
                                                          fontSize: 24.0,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ))
                                              else if ((scheduleDataBaseList
                                                          .length >
                                                      0) &&
                                                  (i <
                                                      (scheduleDataBaseList
                                                              .length -
                                                          1)))
                                                if (scheduleDataBaseList[i]
                                                        .intSchedule ==
                                                    scheduleDataBaseList[i + 1]
                                                        .intSchedule)
                                                  Container(
                                                    height: (scheduleDataBaseList[
                                                                    i + 1]
                                                                .intTime -
                                                            scheduleDataBaseList[
                                                                    i]
                                                                .intTime) *
                                                        1.5,
                                                    width: 360,
                                                    color: Color(0xFF15406A),
                                                    child: Text(
                                                      scheduleDataBaseList[i]
                                                          .strEvent,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF236AB1),
                                                        fontSize: 24.0,
                                                      ),
                                                    ),
                                                  )
                                                else
                                                  SizedBox(
                                                      height: (scheduleDataBaseList[
                                                                      i + 1]
                                                                  .intTime -
                                                              scheduleDataBaseList[
                                                                      i]
                                                                  .intTime) *
                                                          1.5)
                                              else
                                                SizedBox(
                                                    height: (2160 -
                                                        scheduleDataBaseList[i]
                                                                .intTime *
                                                            1.5)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

String strMonthName(String strMonth) {
  final arrayMonthName = {
    '1': 'January',
    '2': 'February',
    '3': 'March',
    '4': 'April',
    '5': 'May',
    '6': 'June',
    '7': 'July',
    '8': 'August',
    '9': 'September',
    '10': 'October',
    '11': 'November',
    '12': 'December',
  };

  return arrayMonthName[strMonth];
}

List<ScheduleDataBase> toScheduleDataBaseList(String strYear, String strMonth,
    String strDate, List<Schedule> scheduleList) {
  var scheduleDataBaseList = List<ScheduleDataBase>();

  var varIndex = 0;

  for (int i = 0; i < scheduleList.length; i++) {
    if ((strYear == scheduleList[i].strYear) &&
        (strMonth == scheduleList[i].strMonth) &&
        (strDate == scheduleList[i].strDate)) {
      /* 開始時間の登録 */
      var scheduleDataBase0 = ScheduleDataBase();
      scheduleDataBase0.intIndex = (varIndex * 2 + 0);
      scheduleDataBase0.intSchedule = varIndex;
      scheduleDataBase0.intState = 0;
      scheduleDataBase0.intTime = int.parse(scheduleList[i].strStartHour) * 60 +
          int.parse(scheduleList[i].strStartMinute);
      scheduleDataBase0.strEvent = scheduleList[i].strEvent;
      scheduleDataBaseList.add(scheduleDataBase0);
      /* 終了時間の登録 */
      var scheduleDataBase1 = ScheduleDataBase();
      scheduleDataBase1.intIndex = (varIndex * 2 + 1);
      scheduleDataBase1.intSchedule = varIndex;
      scheduleDataBase1.intState = 1;
      scheduleDataBase1.intTime = int.parse(scheduleList[i].strEndHour) * 60 +
          int.parse(scheduleList[i].strEndMinute);
      scheduleDataBase1.strEvent = scheduleList[i].strEvent;
      scheduleDataBaseList.add(scheduleDataBase1);

      varIndex += 1;
    } else {
      /* NOP */
    }
  }
  return scheduleDataBaseList;
}
