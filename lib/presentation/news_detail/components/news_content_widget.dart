import 'package:flutter/material.dart';

class NewsContentWidget extends StatelessWidget {
  const NewsContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Working to make our Android application more modular, I ended up with a sample that included a set of on-demand features grouped inside a folder:',
      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
    );
  }
}
