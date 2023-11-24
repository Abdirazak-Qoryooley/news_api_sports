import 'package:http/http.dart' as http;

import '../model/news_model.dart';

class RemoteNewsService {
  static var client = http.Client();

  static Future<List<Articles>?> fetchNewsArticles() async {
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=sports soccer&apiKey=fbd75420bf9a4ce4b274f301f0aa8b37&pagesize=100&sports=sports"));
    if (response.statusCode == 200) {
      return newsArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}
