import 'package:dio/dio.dart';
import '../Model/News.dart';



class APIHelper_dio{
  APIHelper_dio._();
  static final APIHelper_dio apiHelper_dio=APIHelper_dio._();

  Future<List<News>?> featchAllNews()async{

    Response response= await Dio().get("https://newsapi.org/v2/top-headlines/sources?apikey=7cc19f66029e48fabeef69827c131cd1");

    if(response.statusCode==200)
    {

      final Map<String, dynamic> data = response.data;

      final List<dynamic> sourcesList = data['sources'];


      List<News> news =sourcesList.map((e) => News.fromJson(data :e)).toList();
      return news;
    }
    else {

      print('Failed to load news');
      return null;
    }
  }

  Future<List<News>?> fetchNewsByCategory(String category) async {

    Response response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?category=$category&apikey=7cc19f66029e48fabeef69827c131cd1");

    if (response.statusCode == 200) {

      final data = response.data;
      print(data);
      List<dynamic> articles = data['articles'];
      return articles.map((json) => News.fromJson(data: json)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }


}