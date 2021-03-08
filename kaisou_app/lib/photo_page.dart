import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
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
        color: Color(0xFF15406A),
        child: Center(
          child: Text(
            'Photo',
            style: TextStyle(
              color: Color(0xFF000000), //184, 213, 241
              fontSize: 36.0,
            ),
          ),
        ),
      ),
    );
  }
}
