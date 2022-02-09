import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_news_app/domain/usecase/news/data/news_data.dart';

part 'news_home_state.freezed.dart';

@freezed
class NewsHomeState with _$NewsHomeState {
  const factory NewsHomeState({
    @Default([]) List<NewsData> newsData,
    @Default(false) bool isLoading,
  }) = _NewsHomeState;
}
