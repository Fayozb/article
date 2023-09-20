import 'package:flutter/material.dart';

import 'article.dart';

class DetailsPage extends StatefulWidget {
  final Article article;

  const DetailsPage({super.key, required this.article});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(blurRadius: 7, spreadRadius: 4, color: Colors.grey)
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#${widget.article.id}',
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.indigo)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${widget.article.title}',
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.article.body}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
