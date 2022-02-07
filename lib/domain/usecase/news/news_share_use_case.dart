import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/model/news/news.dart';
import 'package:jet_news_app/domain/repository/news_repository.dart';

import '../usecase.dart';

class NewsShareUseCase implements UseCase<bool, News> {
  final NewsRepository _newsRepository;

  NewsShareUseCase(this._newsRepository);

  @override
  Future<Result<bool>> call(News news) async {
    final result = await _newsRepository.shareNews(news);

    return result.when(success: (isShared) {
      return Result.success(isShared);
    }, error: (message) {
      return Result.error(message);
    });
  }
}
