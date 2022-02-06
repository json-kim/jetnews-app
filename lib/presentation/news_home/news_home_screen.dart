import 'package:flutter/material.dart';
import 'package:jet_news_app/presentation/interest/interest_screen.dart';
import 'package:jet_news_app/presentation/news_detail/news_detail_screen.dart';

import 'components/news_list_card.dart';
import 'components/news_list_tile.dart';
import 'components/top_story_card.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
      ),
      appBar: AppBar(
        title: const Text('JetNews'),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.list_alt),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TopStoryCard(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NewsDetailScreen(),
                ),
              );
            },
          ),
          NewsListTile(onTap: () {}, btnTap: () {}),
          NewsListTile(onTap: () {}, btnTap: () {}),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                NewsListCard(onTap: () {}),
                NewsListCard(onTap: () {}),
                NewsListCard(onTap: () {}),
              ],
            ),
          ),
          NewsListTile(onTap: () {}, btnTap: () {}),
          NewsListTile(onTap: () {}, btnTap: () {}),
          NewsListTile(onTap: () {}, btnTap: () {}),
        ],
      ),
    );
  }
}
