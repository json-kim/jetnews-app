import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/model/news/author.dart';

class AuthorProfileBar extends StatelessWidget {
  final Author author;
  final String date;

  const AuthorProfileBar({
    required this.author,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/07/22/16/54/portrait-1535266_960_720.jpg'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 작가 이름
                Text(author.name),

                // 날짜
                Text(date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
