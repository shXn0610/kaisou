import 'package:flutter/material.dart';
import 'schedule_page.dart';
import 'page_route/fade_page_route.dart';

class DatePage extends StatelessWidget {
  DatePage(this.strYear, this.strMonth);
  final String strYear;
  final String strMonth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        color: Color(0xFF77AAE2),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Text(
                strYear + ' ' + strMonthName(strMonth),
                style: TextStyle(
                  color: Color(0xFF236AB1),
                  fontSize: 20.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                    height: 15,
                  ),
                  for (int i = 0; i < 7; i++)
                    SizedBox(
                      width: 52,
                      height: 15,
                      child: Text(
                        strWeekName(i),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF236AB1),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 10,
                    height: 15,
                  ),
                ],
              ),
              for (int j = 0; j < 6; j++)
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      for (int i = 0; i < 7; i++)
                        Container(
                          width: 52,
                          child: Column(
                            children: <Widget>[
                              FlatButton(
                                minWidth: 88.0,
                                child: Text(
                                  strDateName(strYear, strMonth, (i + 7 * j)),
                                  style: TextStyle(
                                    color: Color(0xFF236AB1),
                                    fontSize: 15.0,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      FadePageRoute(
                                          widget: SchedulePage(
                                              strYear,
                                              strMonth,
                                              (i + 7 * j).toString())));
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        width: 10,
                      ),
                    ]),
              SizedBox(
                height: 30,
              ),
            ]),
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

String strWeekName(var varWeek) {
  final arrayWeekName = {
    0: 'SUN',
    1: 'MON',
    2: 'TUE',
    3: 'WED',
    4: 'THU',
    5: 'FRI',
    6: 'SAT',
  };

  return arrayWeekName[varWeek];
}

String strDateName(
  String strYear,
  String strMonth,
  var varIndex,
) {
  final arrayDateNum = {
    '1': 31,
    '2': (28 + intLeapYearJudge(int.parse(strYear))),
    '3': 31,
    '4': 30,
    '5': 31,
    '6': 30,
    '7': 31,
    '8': 31,
    '9': 30,
    '10': 31,
    '11': 30,
    '12': 31,
  };

  var varSpaceNum = intCalcSpaceNum(int.parse(strYear), int.parse(strMonth));

  if (varIndex < varSpaceNum) {
    return '';
  } else if (varIndex < (arrayDateNum[strMonth] + varSpaceNum)) {
    return (varIndex + 1 - varSpaceNum).toString();
  } else {
    return '';
  }
}

int intLeapYearJudge(int intYear) {
  if (((intYear % 400) == 0) ||
      (((intYear % 4) == 0) && ((intYear % 100) != 0))) {
    return 1;
  } else {
    return 0;
  }
}

int intCalcSpaceNum(int intYear, int intMonth) {
  var varSumDate = 0;
  var varSpaceNum;
  final arrayDateNum = {
    1: 31,
    2: (28 + intLeapYearJudge(intYear)),
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31,
  };

  /* Year */
  for (int i = 0; i < (intYear - 1); i++) {
    varSumDate += (365 + intLeapYearJudge(intYear));
  }
  /* Month */
  for (int i = 0; i < (intMonth - 1); i++) {
    varSumDate += arrayDateNum[i + 1];
  }

  varSpaceNum = ((varSumDate % 7) + 1) % 7;

  return varSpaceNum;
}
