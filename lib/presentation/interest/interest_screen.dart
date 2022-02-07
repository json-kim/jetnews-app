import 'package:flutter/material.dart';
import 'package:jet_news_app/presentation/news_home/news_home_screen.dart';
import 'package:jet_news_app/presentation/widget/news_drawer.dart';

import 'components/interest_list_tile.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NewsDrawer(),
      appBar: AppBar(
        title: const Text('Interest'),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.list_alt),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          onTap: (value) {},
          tabs: const [
            Tab(text: 'Topics'),
            Tab(text: 'People'),
            Tab(text: 'Publications'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Topic 리스트뷰
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 섹션 타이틀
              Text(
                'Android',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),

              // 섹션 리스트타일
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              const SizedBox(height: 16),

              // 섹션 타이틀
              Text(
                'Android',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),

              // 섹션 리스트타일
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              const SizedBox(height: 16),
            ],
          ),

          // People 리스트뷰
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
            ],
          ),

          // Publication 리스트뷰
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
              InterestListTile(onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
