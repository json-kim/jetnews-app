import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/model/interest/interest.dart';
import 'package:jet_news_app/domain/model/interest/interest_section.dart';

abstract class InterestRepository {
  Future<Result<List<InterestSection>>> getTopicInterest(int page);

  Future<Result<List<Interest>>> getPeopleInterest(int page);

  Future<Result<List<Interest>>> getPublicationInterest(int page);

  Future<Result<bool>> checkInterest(int interestId);

  Future<Result<List<int>>> getChecked(int userId);
}
