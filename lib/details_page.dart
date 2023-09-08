import 'package:flutter/material.dart';
import 'package:article/article.dart';

class DetailsPage extends StatelessWidget {
  final Article article;

  const DetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Article Body',
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 20,width: 20,),
          Container(
            width: 380,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(blurRadius: 8,
                  spreadRadius: 2)
                ],
                color: Colors.white70
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#${article.id}',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22,color: Colors.blue),),
                  Text('${article.body}',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),textAlign: TextAlign.center,
                  ),
                ],
              ),
          )
        ],
      ),
    );
  }
}
