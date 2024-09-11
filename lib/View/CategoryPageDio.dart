

import 'package:flutter/material.dart';
import 'package:new_api_project_2/Controller/APIHelper.dart';
import 'package:new_api_project_2/Controller/APIHelper_dio.dart';
import 'package:new_api_project_2/View/DetailPageHttp.dart';

import '../Model/News.dart';

class CategoryPageDio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CategoryPageDioState();
  }

}
class CategoryPageDioState extends State<CategoryPageDio>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Categories",style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
        future: APIHelper_dio.apiHelper_dio.featchAllNews(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
          {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          }
          else if(snapshot.hasData) {
            List<News>? data = snapshot.data;
            Set<String?> uniqueCategories = {};
            if (data != null) {
              for (var newsItem in data) {
                uniqueCategories.add(newsItem.category);
              }

              List<String?> categoriesList = uniqueCategories.toList();

              return categoriesList.isEmpty ?
              Center(child: Text("No data availabel ..."),) :
              ListView.builder(
                itemCount: categoriesList.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPageHttp(category: categoriesList[i]),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        color: Colors.blue.shade100,
                        child: ListTile(
                          leading: Text("${i+1}"),
                          title: Text("${categoriesList[i]}"),
                        ),
                      ),
                    ),
                  );
                },);
            }
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }

}