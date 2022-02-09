import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/data/data_source/fake/news_fake_data_source.dart';
import 'package:jet_news_app/data/data_source/local/news_local_data_source.dart';
import 'package:jet_news_app/domain/model/news/news.dart';
import 'package:jet_news_app/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsFakeDataSource _remoteDataSource;
  final NewsLocalDataSource _localDataSource;

  NewsRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<bool>> bookmarkNews(String newsId) async {
    final result = await _localDataSource.bookmarkNews(newsId);

    return result.when(success: (isBookmarked) {
      return Result.success(isBookmarked);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<bool>> favoriteNews(String newsId) async {
    final result = await _localDataSource.favoriteNews(newsId);

    return result.when(success: (isFavorite) {
      return Result.success(isFavorite);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<String>>> getBookmark(int userId) async {
    // 실제 서비스에서는 서버에 요청
    final result = await _localDataSource.getBookmarks();

    return result.when(success: (bookmarkList) {
      return Result.success(bookmarkList);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<String>>> getFavorite(int userId) async {
    // 실제 서비스에서는 서버에 요청
    final result = await _localDataSource.getFavorite();

    return result.when(success: (favoriteList) {
      return Result.success(favoriteList);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<News>>> getNews(int page) async {
    final result = await _remoteDataSource.requestNews(page);

    return result.when(success: (news) {
      return Result.success(news);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<bool>> shareNews(News news) async {
    // TODO: 공유하기 기능

    return const Result.success(true);
  }
}
