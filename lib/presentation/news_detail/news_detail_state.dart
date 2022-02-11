import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_news_app/domain/usecase/news/data/news_data.dart';

part 'news_detail_state.freezed.dart';

@freezed
class NewsDetailState with _$NewsDetailState {
  const factory NewsDetailState({
    required NewsData newsData,
  }) = _NewsDetailState;
}
