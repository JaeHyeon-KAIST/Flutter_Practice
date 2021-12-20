import 'package:flutter/material.dart';

class LocationFilterScreen extends StatefulWidget {
  _LocationFilterScreenState createState() => _LocationFilterScreenState();
}

class _LocationFilterScreenState extends State<LocationFilterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      'assets/location2.png',
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
