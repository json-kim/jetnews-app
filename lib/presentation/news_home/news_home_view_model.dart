import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/model/news/news.dart';
import 'package:jet_news_app/domain/usecase/news/news_bookmark_use_case.dart';
import 'package:jet_news_app/domain/usecase/news/news_load_use_case.dart';
import 'package:jet_news_app/presentation/news_home/news_home_event.dart';
import 'package:jet_news_app/presentation/news_home/news_home_ui_event.dart';

import 'news_home_state.dart';

class NewsHomeViewModel with ChangeNotifier {
  final NewsLoadUseCase _newsLoadUseCase;
  final NewsBookmarkUseCase _newsBookmarkUseCase;

  NewsHomeViewModel(this._newsLoadUseCase, this._newsBookmarkUseCase) {
    _loadNews();
  }

  NewsHomeState _state = NewsHomeState();

  NewsHomeState get state => _state;

  final StreamController<NewsHomeUiEvent> _streamController =
      StreamController<NewsHomeUiEvent>.broadcast();

  Stream<NewsHomeUiEvent> get stream => _streamController.stream;

  int _page = 0;

  void onEvent(NewsHomeEvent event) {
    event.when(loadNews: _loadNews, bookmarkNews: _bookmarkNews);
  }

  Future<void> _loadNews() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _newsLoadUseCase(_page);

    result.when(success: (newsData) {
      _state = _state.copyWith(newsData: newsData);
    }, error: (message) {
      // TODO: 가져오기 실패, 스낵바
      debugPrint(message);
      _streamController
          .add(const NewsHomeUiEvent.showSnackBar('뉴스 정보를 가져오는데 실패했습니다.'));
    });

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  Future<void> _bookmarkNews(String newsId) async {
    final result = await _newsBookmarkUseCase(newsId);

    result.when(success: (isBookmark) {
      final newsData = _state.newsData;
      final index =
          newsData.indexWhere((newsData) => newsData.news.id == newsId);
      final data = newsData[index];
      final newData = data.copyWith(isBookmark: isBookmark);
      newsData[index] = newData;

      _state = _state.copyWith(newsData: newsData);
    }, error: (message) {
      // TODO: 북마크 등록 실패, 스낵바
      debugPrint(message);
      _streamController
          .add(const NewsHomeUiEvent.showSnackBar('북마크 등록에 실패했습니다.'));
    });

    notifyListeners();
  }
}
