import 'package:flutter/material.dart';
import 'package:jet_news_app/presentation/interest/interest_screen.dart';
import 'package:jet_news_app/presentation/news_detail/news_detail_screen.dart';
import 'package:jet_news_app/presentation/widget/news_drawer.dart';

import 'components/news_list_card.dart';
import 'components/news_list_tile.dart';
import 'components/top_story_card.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NewsDrawer(),
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
