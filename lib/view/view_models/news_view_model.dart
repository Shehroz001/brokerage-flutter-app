import 'package:brokerage_app/models/news_model.dart';
import 'package:brokerage_app/repository/news_repository.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsModel> fetchNewsApi() async {
    final response = await _rep.fetchNewsApi();
    return response;
  }
}
