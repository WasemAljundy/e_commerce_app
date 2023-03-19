import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Most Selling',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 225,
            maxWidth: double.infinity,
          ),
          child: GridView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 19,
              childAspectRatio: 212/141,
            ),
            itemBuilder: (context, index) {
              return const Card(
                elevation: 5,
              );
            },
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Most Selling',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 225,
            maxWidth: double.infinity,
          ),
          child: GridView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 19,
              childAspectRatio: 212/141,
            ),
            itemBuilder: (context, index) {
              return const Card(
                elevation: 5,
              );
            },
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Best Trade',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const ListTile(
              leading: Icon(Icons.article, size: 30,),
              title: Text('Title'),
              subtitle: Text('SubTitle'),
            );
        },)
      ],
    );
  }
}

/*

** Old Home UI

return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shrinkWrap: true,
      children: const [
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text('Title'),
          subtitle: Text('SubTitle'),
          trailing: Icon(Icons.add),
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text('Title'),
          subtitle: Text('SubTitle'),
          trailing: Icon(Icons.add),
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text('Title'),
          subtitle: Text('SubTitle'),
          trailing: Icon(Icons.add),
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text('Title'),
          subtitle: Text('SubTitle'),
          trailing: Icon(Icons.add),
        ),
        ListTile(
          leading: Icon(Icons.person, size: 40),
          title: Text('Title'),
          subtitle: Text('SubTitle'),
          trailing: Icon(Icons.add),
        ),
      ],
    );
*/
