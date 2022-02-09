import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/usecase/news/data/news_data.dart';

class NewsListCard extends StatelessWidget {
  final NewsData newsData;
  final void Function() onTap;

  const NewsListCard({
    required this.newsData,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              // 썸네일 이미지
              Expanded(
                child: Image.network(
                  'https://github.com/android/compose-samples/blob/main/JetNews/app/src/main/res/drawable-nodpi/post_1.png?raw=true',
                  fit: BoxFit.cover,
                ),
              ),

              // 뉴스 제목, 작가 이름
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(newsData.news.title),
                    Text(
                      newsData.news.author.name,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
