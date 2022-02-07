import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/repository/news_repository.dart';

import '../usecase.dart';

class NewsBookmarkUseCase implements UseCase<bool, String> {
  final NewsRepository _newsRepository;

  NewsBookmarkUseCase(this._newsRepository);

  @override
  Future<Result<bool>> call(String newsId) async {
    final result = await _newsRepository.bookmarkNews(newsId);

    return result.when(success: (isBookmark) {
      return Result.success(isBookmark);
    }, error: (message) {
      return Result.error(message);
    });
  }
}
