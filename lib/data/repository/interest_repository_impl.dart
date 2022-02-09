import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/data/data_source/fake/interest_fake_data_source.dart';
import 'package:jet_news_app/data/data_source/local/interest_local_data_source.dart';
import 'package:jet_news_app/domain/model/interest/interest.dart';
import 'package:jet_news_app/domain/model/interest/interest_section.dart';
import 'package:jet_news_app/domain/repository/interest_repository.dart';

class InterestRepositoryImpl implements InterestRepository {
  final InterestFakeDataSource _fakeDataSource;
  final InterestLocalDataSource _localDataSource;

  InterestRepositoryImpl(this._fakeDataSource, this._localDataSource);

  @override
  Future<Result<bool>> checkInterest(int interestId) async {
    final result = await _localDataSource.checkInterest(interestId);

    return result.when(success: (isChecked) {
      return Result.success(isChecked);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<int>>> getChecked(int userId) async {
    // 실제 서비스는 서버에 요청
    final result = await _localDataSource.getCheckedInterestId();

    return result.when(success: (idList) {
      return Result.success(idList);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<Interest>>> getPeopleInterest(int page) async {
    final result = await _fakeDataSource.requestPeopleInterest();

    return result.when(success: (interestList) {
      return Result.success(interestList);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<Interest>>> getPublicationInterest(int page) async {
    final result = await _fakeDataSource.requestPublicationInterest();

    return result.when(success: (interestList) {
      return Result.success(interestList);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<InterestSection>>> getTopicInterest(int page) async {
    final result = await _fakeDataSource.requestTopicInterest();

    return result.when(success: (sectionList) {
      return Result.success(sectionList);
    }, error: (message) {
      return Result.error(message);
    });
  }
}
