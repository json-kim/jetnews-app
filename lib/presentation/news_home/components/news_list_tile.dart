import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/usecase/news/data/news_data.dart';

class NewsListTile extends StatelessWidget {
  final NewsData newsData;
  final void Function() onTap;
  final void Function() btnTap;

  const NewsListTile({
    required this.newsData,
    required this.onTap,
    required this.btnTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.grey),
        ListTile(
          contentPadding: EdgeInsets.zero,

          // 이미지 썸네일 (리딩)
          leading: Image.network(
              'https://github.com/android/compose-samples/blob/main/JetNews/app/src/main/res/drawable-nodpi/post_1_thumb.png?raw=true'),

          // 뉴스 타이틀
          title: Text(
            newsData.news.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          // 뉴스 작가
          subtitle: Text(newsData.news.author.name),

          // 구독 버튼
          trailing: IconButton(
            onPressed: btnTap,
            icon: newsData.isBookmark
                ? const Icon(Icons.bookmark)
                : const Icon(Icons.bookmark_outline),
          ),

          // 클릭 콜백
          onTap: onTap,
        )
      ],
    );
  }
}
