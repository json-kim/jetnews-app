import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/repository/news_repository.dart';
import 'package:jet_news_app/domain/usecase/usecase.dart';

class NewsFavoriteUseCase implements UseCase<bool, String> {
  final NewsRepository _newsRepository;

  NewsFavoriteUseCase(this._newsRepository);

  @override
  Future<Result<bool>> call(String newsId) async {
    final result = await _newsRepository.favoriteNews(newsId);

    return result.when(success: (isFavorite) {
      return Result.success(isFavorite);
    }, error: (message) {
      return Result.error(message);
    });
  }
}
