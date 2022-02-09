import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/usecase/news/data/news_data.dart';
import 'package:jet_news_app/presentation/news_detail/news_detail_screen.dart';
import 'package:jet_news_app/presentation/news_home/news_home_event.dart';
import 'package:jet_news_app/presentation/widget/news_drawer.dart';
import 'package:provider/provider.dart';

import 'components/news_list_card.dart';
import 'components/news_list_tile.dart';
import 'components/top_story_card.dart';
import 'news_home_view_model.dart';

class NewsHomeScreen extends StatefulWidget {
  const NewsHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewsHomeScreen> createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<NewsHomeViewModel>();
      _streamSubscription = viewModel.stream.listen((event) {
        event.when(showSnackBar: (message) {
          final snackBar = SnackBar(content: Text(message));

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  void moveToDetailPage(NewsData newsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewsDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NewsHomeViewModel>();
    final state = viewModel.state;

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
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TopStoryCard(
                  newsData: state.newsData.first,
                  onTap: () {
                    moveToDetailPage(state.newsData.first);
                  },
                ),
                ...List.generate(
                  2,
                  (index) {
                    final newsData = state.newsData[index + 1];

                    return NewsListTile(
                      newsData: newsData,
                      onTap: () {
                        moveToDetailPage(newsData);
                      },
                      btnTap: () {
                        viewModel.onEvent(
                            NewsHomeEvent.bookmarkNews(newsData.news.id));
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        3,
                        (index) {
                          final newsData = state.newsData[index + 3];

                          return NewsListCard(
                              newsData: newsData,
                              onTap: () {
                                moveToDetailPage(newsData);
                              });
                        },
                      ),
                    ],
                  ),
                ),
                ...List.generate(
                  4,
                  (index) {
                    final newsData = state.newsData[index + 6];

                    return NewsListTile(
                      newsData: newsData,
                      onTap: () {
                        moveToDetailPage(newsData);
                      },
                      btnTap: () {
                        viewModel.onEvent(
                            NewsHomeEvent.bookmarkNews(newsData.news.id));
                      },
                    );
                  },
                ),
              ],
            ),
    );
  }
}
