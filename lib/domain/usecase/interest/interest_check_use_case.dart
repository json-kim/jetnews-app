import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/repository/interest_repository.dart';

import '../usecase.dart';

class InterestCheckUseCase implements UseCase<bool, int> {
  final InterestRepository _interestRepository;

  InterestCheckUseCase(this._interestRepository);

  @override
  Future<Result<bool>> call(int interestId) async {
    final result = await _interestRepository.checkInterest(interestId);

    return result.when(success: (isChecked) {
      return Result.success(isChecked);
    }, error: (message) {
      return Result.error(message);
    });
  }
}
