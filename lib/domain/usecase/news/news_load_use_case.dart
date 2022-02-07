import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/repository/news_repository.dart';
import 'package:jet_news_app/domain/usecase/news/data/news_data.dart';

import '../usecase.dart';

class NewsLoadUseCase implements UseCase<List<NewsData>, int> {
  final NewsRepository _newsRepository;

  NewsLoadUseCase(this._newsRepository);

  @override
  Future<Result<List<NewsData>>> call(int page) async {
    final List<String> bookmarks;
    final List<String> favorites;

    try {
      // TODO: 유저 아이디 받아오기
      bookmarks = await getBookmark(1);
      favorites = await getFavorites(1);
    } catch (e) {
      return Result.error('$runtimeType : 데이터 가져오기 에러 발생');
    }

    final newsResult = await _newsRepository.getNews(page);

    return newsResult.when(success: (newsList) async {
      final newsDataList = newsList
          .map(
            (news) => NewsData(
              news: news,
              isBookmark: bookmarks.contains(news.id),
              isFavorite: favorites.contains(news.id),
            ),
          )
          .toList();

      return Result.success(newsDataList);
    }, error: (message) {
      return Result.error(message);
    });
  }

  Future<List<String>> getBookmark(userId) async {
    final bookmarkResult = await _newsRepository.getBookmark(1);

    return bookmarkResult.when(
      success: (bookmarks) {
        return bookmarks;
      },
      error: (message) {
        throw Exception(message);
      },
    );
  }

  Future<List<String>> getFavorites(userId) async {
    final favoriteResult = await _newsRepository.getFavorite(1);

    return favoriteResult.when(
      success: (favorites) {
        return favorites;
      },
      error: (message) {
        throw Exception(message);
      },
    );
  }
}
