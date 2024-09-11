import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/News.dart';



class APIHelper_http{
  APIHelper_http._();
  static final APIHelper_http apiHelper_http=APIHelper_http._();
  
  Future<List<News>?> featchAllNews()async{
    http.Response response= await http.get(Uri.parse("https://newsapi.org/v2/top-headlines/sources?apikey=7cc19f66029e48fabeef69827c131cd1"));


    if(response.statusCode==200)
      {
        final Map<String, dynamic> data = jsonDecode(response.body);

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
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?category=$category&apikey=7cc19f66029e48fabeef69827c131cd1"
    ));


    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data);
      List<dynamic> articles = data['articles'];
      return articles.map((json) => News.fromJson(data: json)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }


}