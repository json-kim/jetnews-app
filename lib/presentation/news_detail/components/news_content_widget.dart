import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/model/news/paragraph.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsContentWidget extends StatelessWidget {
  final List<Paragraph> paragraphs;

  const NewsContentWidget({
    required this.paragraphs,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...paragraphs
            .map(
              (paragraph) => _buildParagraphWidget(paragraph, context),
            )
            .toList(),
      ],
    );
  }

  Widget _buildParagraphWidget(Paragraph paragraph, BuildContext context) {
    switch (paragraph.type) {
      case ParagraphType.text:
        return Column(
          children: [
            Text(
              paragraph.text,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
            ),
            SizedBox(height: 3.h),
          ],
        );
      case ParagraphType.header:
        return Column(
          children: [
            Text(
              paragraph.text,
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24),
            ),
            SizedBox(height: 3.h),
          ],
        );
      default:
        return Column(
          children: [
            Text(
              paragraph.text,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
            ),
            SizedBox(height: 3.h),
          ],
        );
    }
  }
}
