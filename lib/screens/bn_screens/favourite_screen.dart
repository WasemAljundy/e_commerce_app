import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 20,
        childAspectRatio: 132 / 214,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          color: index % 3 == 0 ? Colors.cyan : Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}

/*
return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20,),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 20,
        mainAxisExtent: 125,
      ),
      children: [
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.teal,
        ),
        Container(
          color: Colors.orange,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.pink,
        ),
      ],
    );
 */
