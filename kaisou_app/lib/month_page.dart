import 'package:flutter/material.dart';
import 'date_page.dart';
import 'page_route/fade_page_route.dart';

class MonthPage extends StatelessWidget {
  MonthPage(this.strYear);
  final String strYear;

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
        color: Color(0xFFB8D5F1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              SizedBox(
                height: 136,
              ),

              Text(strYear,
                style: TextStyle(
                  color: Color(0xFF77AAE2), //184, 213, 241
                  fontSize: 24.0,
                ),
              ),

              for (int j = 0; j < 4; j++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                    ),

                    for (int i = 0; i < 3; i++)
                      FlatButton(
                        child: Text(((i + 3 * j + 1).toString()),
                          style: TextStyle(
                            color: Color(0xFF77AAE2), //184, 213, 241
                            fontSize: 36.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              FadePageRoute(widget: DatePage(strYear, (i + 3 * j + 1).toString()))
                          );
                        },
                      ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),

              SizedBox(
                height: 160,
              ),
            ]
          ),
      ),
    );
  }
}

