import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_detail_event.freezed.dart';

@freezed
class NewsDetailEvent with _$NewsDetailEvent {
  const factory NewsDetailEvent.favorite() = Favorite;
  const factory NewsDetailEvent.bookmark() = Bookmark;
  const factory NewsDetailEvent.share() = Share;
}
