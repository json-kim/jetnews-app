import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/usecase/news/data/news_data.dart';
import 'package:jet_news_app/domain/usecase/news/news_bookmark_use_case.dart';
import 'package:jet_news_app/domain/usecase/news/news_favorite_use_case.dart';
import 'package:jet_news_app/presentation/news_detail/news_detail_event.dart';
import 'package:jet_news_app/presentation/news_detail/news_detail_state.dart';
import 'package:jet_news_app/presentation/news_home/news_home_event.dart';
import 'package:jet_news_app/presentation/news_home/news_home_view_model.dart';

class NewsDetailViewModel with ChangeNotifier {
  final NewsHomeViewModel _newsHomeViewModel;

  NewsDetailState _state;
  NewsDetailState get state {
    final newsData = _newsHomeViewModel.state.newsData
        .singleWhere((data) => data.news.id == _state.newsData.news.id);
    _state = _state.copyWith(newsData: newsData);
    return _state;
  }

  NewsDetailViewModel(this._newsHomeViewModel, NewsData newsData)
      : _state = NewsDetailState(newsData: newsData);

  void onEvent(NewsDetailEvent event) {
    event.when(
        favorite: _favoriteNews, bookmark: _bookmarkNews, share: _shareNews);
  }

  void newsUpdate() {}

  Future<void> _favoriteNews() async {
    _newsHomeViewModel
        .onEvent(NewsHomeEvent.favoriteNews(_state.newsData.news.id));
  }

  Future<void> _bookmarkNews() async {
    _newsHomeViewModel
        .onEvent(NewsHomeEvent.bookmarkNews(_state.newsData.news.id));
  }

  Future<void> _shareNews() async {
    // TODO: 구현 예정
  }
}
