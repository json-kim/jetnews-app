import 'package:flutter/material.dart';

class AuthorProfileBar extends StatelessWidget {
  const AuthorProfileBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://miro.medium.com/fit/c/176/176/1*FP1XQtY1tqwxvdRB_R6ecQ.jpeg'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 작가 이름
                Text('Pietro Maggi'),

                // 날짜
                Text('Aug 3, 2019'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
