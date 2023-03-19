import 'package:flutter/material.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.article,
            size: 30,
          ),
          title: Text('Article No. $index'),
          subtitle: Text('Details: Article No. $index'),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          indent: 20,
          color: Colors.black,
          thickness: 1,
        );
      },
    );
  }
}

/*
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.article),
          title: Text('Article No. $index'),
          subtitle: Text('Details: Article No. $index'),
        );
      },
    );
 */
