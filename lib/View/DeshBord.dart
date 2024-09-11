import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_api_project_2/View/CategoryPageDio.dart';
import 'package:new_api_project_2/View/CategoryPageHttp.dart';

class DeshBord extends StatefulWidget {
  const DeshBord({Key? key}) : super(key: key);

  @override
  State<DeshBord> createState() => _DeshBordState();
}

class _DeshBordState extends State<DeshBord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text("Choose one of them",style: TextStyle(color: Colors.white),),
        ),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 180,
              child: ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryPageHttp()));
              }, child: Padding(
                padding: const EdgeInsets.all(4),
                child: Center(child: Text("Get API from Http")),
              )),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: 180,
              child: ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryPageDio()));
              }, child: Padding(
                padding: const EdgeInsets.all(4),
                child: Center(child: Text("Get API from Dio")),
              )),
            ),
            SizedBox(height: 30,),
          ],
        ),
      )
    );
  }
}
