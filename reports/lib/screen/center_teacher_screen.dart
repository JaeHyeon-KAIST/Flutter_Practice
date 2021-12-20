import 'package:flutter/material.dart';

class CenterTeacherScreen extends StatefulWidget {
  _CenterTeacherScreenState createState() => _CenterTeacherScreenState();
}

class _CenterTeacherScreenState extends State<CenterTeacherScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/center_teacher1.png',
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
