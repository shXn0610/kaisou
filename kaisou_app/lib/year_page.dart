import 'package:flutter/material.dart';
import 'month_page.dart';
import 'page_route/fade_page_route.dart';

class YearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Year',
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFFEAF4FF),
          child: Center(
            child: Container(
              height: 480,

              child: ListView(
                children: <Widget>[
                  for (int i = 2018; i < 2100; i++)

                    FlatButton(
                      height: 100,
                      child: Text('$i',
                        style: TextStyle(
                          color: Color(0xFFB8D5F1), //184, 213, 241
                          fontSize: 48.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            FadePageRoute(widget: MonthPage('$i'))
                        );
                      },
                    ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}