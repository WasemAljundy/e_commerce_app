import 'package:flutter/material.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/user.jpg',
          scale: 20,
        ),
        const SizedBox(height: 30,),
        const CircleAvatar(
          radius: 50,
        ),
        const SizedBox(height: 10,),
        const Text(
          'This is main title',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10,),
        const Text(
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}