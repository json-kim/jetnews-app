import 'package:jet_news_app/domain/model/news/news.dart';

class NewsData {
  final News news;
  final bool isFavorite;
  final bool isBookmark;

  NewsData({
    required this.news,
    required this.isFavorite,
    required this.isBookmark,
  });

  NewsData copyWith({News? news, bool? isFavorite, bool? isBookmark}) {
    return NewsData(
      news: news ?? this.news,
      isFavorite: isFavorite ?? this.isFavorite,
      isBookmark: isBookmark ?? this.isBookmark,
    );
  }
}
