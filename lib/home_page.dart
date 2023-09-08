import 'dart:convert';
import 'package:article/details_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> _article = [];

  @override
  void initState() {
    super.initState();
    _initialFetchArticles();
  }

  Future<void> _initialFetchArticles() async {
    final Uri url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    final response = await http.get(url);
    final List<dynamic> jsonList = json.decode(response.body);
    setState(() {
      _article = jsonList.map((json) => Article.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: ListView.builder(
          itemCount: _article.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              DetailsPage(article: _article[index])));
                },
                child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 4,
                                color: Colors.grey)
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('#${_article[index].id}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800,color: Colors.blue)),
                          Text(
                            '${_article[index].title}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
            SizedBox(
            height: 20,
            )
                        ],
                      ),
                )
                    );


          }),
    );
  }
}
