import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_home_event.freezed.dart';

@freezed
class NewsHomeEvent with _$NewsHomeEvent {
  const factory NewsHomeEvent.loadNews() = LoadNews;
  const factory NewsHomeEvent.bookmarkNews(String newsId) = BookmarkNews;
  const factory NewsHomeEvent.favoriteNews(String newsId) = FavoriteNews;
}
