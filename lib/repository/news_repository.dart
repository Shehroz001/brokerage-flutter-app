import 'dart:convert';
import 'package:brokerage_app/models/news_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<NewsModel> fetchNewsApi() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2ed01149d2544f5d928df0dd302c0eda';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
