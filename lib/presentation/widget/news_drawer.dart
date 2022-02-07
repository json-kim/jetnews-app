import 'package:flutter/material.dart';
import 'package:jet_news_app/presentation/interest/interest_screen.dart';
import 'package:jet_news_app/presentation/news_home/news_home_screen.dart';

class NewsDrawer extends StatelessWidget {
  const NewsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.list),
                      Text('JetNews'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => NewsHomeScreen(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Icon(Icons.home),
                        SizedBox(width: 16),
                        Text('Home'),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => InterestScreen(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Icon(Icons.list),
                        SizedBox(width: 16),
                        Text('Interests'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
