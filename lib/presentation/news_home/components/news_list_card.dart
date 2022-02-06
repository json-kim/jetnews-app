import 'package:flutter/material.dart';

class NewsListCard extends StatelessWidget {
  final void Function() onTap;

  const NewsListCard({
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
                  children: [
                    Text('A little thing about Android module paths'),
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
