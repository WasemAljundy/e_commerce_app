import 'package:flutter/material.dart';

class UsageQuestionsScreen extends StatelessWidget {
  const UsageQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.question_answer),
          title: Text('Usage $index'),
          subtitle: const Text('Answer'),
        );
      },
    );
  }
}
