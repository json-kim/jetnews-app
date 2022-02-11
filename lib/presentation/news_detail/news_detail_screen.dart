import 'package:flutter/material.dart';
import 'package:jet_news_app/presentation/news_detail/news_detail_event.dart';
import 'package:jet_news_app/presentation/news_detail/news_detail_view_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

import 'components/auth_profile_bar.dart';
import 'components/news_content_widget.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NewsDetailViewModel>();
    final state = viewModel.state;
    final newsData = state.newsData;

    return Scaffold(
      appBar: AppBar(
        // 타이틀
        title: Text('Published in ${newsData.news.publication.name}'),
      ),
      bottomNavigationBar: SizedBox(
        height: 10.h,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  viewModel.onEvent(const NewsDetailEvent.favorite());
                },
                icon: newsData.isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () {
                  viewModel.onEvent(const NewsDetailEvent.bookmark());
                },
                icon: newsData.isBookmark
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_outline)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            Expanded(child: Container()),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.font_download_outlined)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 이미지 카드
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              'https://github.com/android/compose-samples/blob/main/JetNews/app/src/main/res/drawable-nodpi/post_1.png?raw=true',
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // 타이틀
          Text(
            newsData.news.title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontSize: 32),
          ),
          const SizedBox(height: 8),

          // 서브타이틀
          Text(newsData.news.subtitle,
              style: const TextStyle(color: Colors.grey)),

          // 작가 프로필
          AuthorProfileBar(
              author: newsData.news.author, date: newsData.news.date),

          // 기사 내용
          NewsContentWidget(paragraphs: newsData.news.paragraphs)
        ],
      ),
    );
  }
}
