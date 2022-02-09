import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/usecase/news/data/news_data.dart';

class TopStoryCard extends StatelessWidget {
  final NewsData newsData;
  final void Function() onTap;

  const TopStoryCard({
    required this.newsData,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 섹션 이름
          Text(
            'Top stories for you',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),

          // 이미지 카드
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              'https://github.com/android/compose-samples/blob/main/JetNews/app/src/main/res/drawable-nodpi/post_1.png?raw=true',
              height: 150,
              fit: BoxFit.fitHeight,
            ),
            clipBehavior: Clip.antiAlias,
          ),
          const SizedBox(height: 8),

          // 타이틀
          Text(
            newsData.news.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 2),

          // 서브타이틀
          Text(
            newsData.news.subtitle,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 4),

          // 작가 이름
          Text(newsData.news.author.name),
          const SizedBox(height: 2),

          // 날짜
          Text(
            newsData.news.date,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
