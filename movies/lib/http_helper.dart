import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=a407d82265577e3de4eed4d7ebc93d26';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=ko-KR';
  final String page = '&page=';
  final String query1 = '&query=';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=a407d82265577e3de4eed4d7ebc93d26';

  Future<List> getUpcoming(int num) async {
    final String upcoming =
        urlBase + urlUpcoming + urlKey + urlLanguage + page + num.toString();
    print(upcoming);
    http.Response result = await http.get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List> findMovies(String title, int num) async {
    final String query =
        urlSearchBase + urlLanguage + query1 + title + page + num.toString();
    print(query);
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("########");
      return null;
    }
  }
}
