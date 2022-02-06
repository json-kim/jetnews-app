import 'package:flutter/material.dart';

import 'components/auth_profile_bar.dart';
import 'components/news_content_widget.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 타이틀 : Published in ${publication.name}
        title: Text('Published in Android Developers'),
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
            'A little thing about Android module paths',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontSize: 32),
          ),
          const SizedBox(height: 8),

          // 서브타이틀
          Text(
              'How to configure your module paths, instead of using Gradle’s default.',
              style: TextStyle(color: Colors.grey)),

          // 작가 프로필
          AuthorProfileBar(),

          // 기사 내용
          NewsContentWidget()
        ],
      ),
    );
  }
}
