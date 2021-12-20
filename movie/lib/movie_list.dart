import 'package:flutter/material.dart';
import 'http_helper.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

String result;
HttpHelper helper;

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    helpder.getUpcoming().then((value) {
      setState(() {
        result = value;
      });
    });
    return Scaffold(
        addBar: AppBar(
          title: Text('Movies'),
        ),
        body: Container(child: Text(result)));
  }
}
