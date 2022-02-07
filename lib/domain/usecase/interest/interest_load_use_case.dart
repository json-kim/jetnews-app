import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/model/interest/interest.dart';
import 'package:jet_news_app/domain/model/interest/interest_section.dart';
import 'package:jet_news_app/domain/repository/interest_repository.dart';

import '../usecase.dart';
import 'data/interest_data.dart';

class InterestLoadUseCase implements UseCase<InterestSet, int> {
  final InterestRepository _interestRepository;

  InterestLoadUseCase(this._interestRepository);

  @override
  Future<Result<InterestSet>> call(int page) async {
    final List<InterestSection> interestSections;
    final List<Interest> peopleInterests;
    final List<Interest> publicationInterests;
    final List<int> ids;

    try {
      interestSections = await getInterestSection(page);
      peopleInterests = await getPeopleInterest(page);
      publicationInterests = await getPublicationInterest(page);
      ids = await getChecked(1);
    } catch (e) {
      return Result.error('$runtimeType : 에러 발생 $e');
    }

    return Result.success(InterestSet.build(
        interestSections, peopleInterests, publicationInterests, ids));
  }

  Future<List<int>> getChecked(int userId) async {
    final result = await _interestRepository.getChecked(userId);

    return result.when(success: (checked) {
      return checked;
    }, error: (message) {
      throw Exception(message);
    });
  }

  Future<List<InterestSection>> getInterestSection(int page) async {
    final result = await _interestRepository.getInterestSections(page);

    return result.when(success: (interestSection) {
      return interestSection;
    }, error: (message) {
      throw Exception(message);
    });
  }

  Future<List<Interest>> getPeopleInterest(int page) async {
    final result = await _interestRepository.getPeopleInterest(page);

    return result.when(success: (peopleInterests) {
      return peopleInterests;
    }, error: (message) {
      throw Exception(message);
    });
  }

  Future<List<Interest>> getPublicationInterest(int page) async {
    final result = await _interestRepository.getPublicationInterest(page);

    return result.when(success: (publicationInterests) {
      return publicationInterests;
    }, error: (message) {
      throw Exception(message);
    });
  }
}
