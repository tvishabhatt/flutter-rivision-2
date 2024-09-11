import 'package:flutter/material.dart';
import 'package:new_api_project_2/Controller/APIHelper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Model/News.dart';

class DetailPageHttp extends StatelessWidget {
  final String? category;

  DetailPageHttp({required this.category});

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("$category News",style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<News>?>(
        future: APIHelper_http.apiHelper_http.fetchNewsByCategory(category??"general"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<News>? data = snapshot.data;

            return data == null || data.isEmpty
                ? Center(child: Text("No news available."))
                : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    color: Colors.blue.shade100,
                    child: ListTile(
                      title: Text(data[i].name?? 'No name',style: TextStyle(fontWeight: FontWeight.bold)),

                      subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[i].description ?? 'No description'),
                          InkWell(onTap: () async{
                            if (data[i].url != null) {
                              _launchURL(data[i].url!);
                            }
                          },

                          child:Text(data[i].url ?? 'No url',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline, decorationColor: Colors.blue, decorationThickness: 2,),)),

                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No data available."));
          }
        },
      ),
    );
  }
}


