import 'package:flutter/material.dart';

class OutBoardingIndicator extends StatelessWidget {

  final bool selected;

  const OutBoardingIndicator({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 10,
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsetsDirectional.only(end: 10),
    );
  }
}