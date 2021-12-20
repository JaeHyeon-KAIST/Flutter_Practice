import 'dart:io';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlKey = 'api_key=a407d82265577e3de4eed4d7ebc93d26';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=ko-KR';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=a407d82265577e3de4eed4d7ebc93d26&query=';

  Future<String?> getUpcomming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      return responseBody;
    } else {
      return null;
    }
  }
}
