import 'package:flutter/material.dart';

class GeneralQuestionsScreen extends StatelessWidget {
  const GeneralQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.question_answer),
          title: Text('General Question $index'),
          subtitle: const Text('Answer'),
        );
      },
    );
  }
}
