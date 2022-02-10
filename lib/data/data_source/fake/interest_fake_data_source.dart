import 'dart:convert';

import 'package:jet_news_app/core/result/result.dart';
import 'package:jet_news_app/domain/model/interest/interest.dart';
import 'package:jet_news_app/domain/model/interest/interest_section.dart';

class InterestFakeDataSource {
  Future<Result<List<InterestSection>>> requestTopicInterest() async {
    try {
      final List jsonResult = jsonDecode(fakeTopicInterestJson);
      final List<InterestSection> sectionList =
          jsonResult.map((json) => InterestSection.fromJson(json)).toList();

      return Result.success(sectionList);
    } catch (e) {
      return Result.error('$runtimeType.requestTopicInterest : 에러 발생 \n$e');
    }
  }

  Future<Result<List<Interest>>> requestPeopleInterest() async {
    try {
      final List jsonResult = jsonDecode(fakePeopleInterestJson);
      final List<Interest> peopleInterest = jsonResult
          .map((json) => Interest.fromJson(json, InterestCategory.people))
          .toList();

      return Result.success(peopleInterest);
    } catch (e) {
      return Result.error('$runtimeType.requestPeopleInterest : 에러 발생 \n$e');
    }
  }

  Future<Result<List<Interest>>> requestPublicationInterest() async {
    try {
      final List jsonResult = jsonDecode(fakePublicationInterestJson);
      final List<Interest> publicationInterest = jsonResult
          .map((json) => Interest.fromJson(json, InterestCategory.publication))
          .toList();

      return Result.success(publicationInterest);
    } catch (e) {
      return Result.error(
          '$runtimeType.requestPublicationInterest : 에러 발생 \n$e');
    }
  }
}

const String fakeTopicInterestJson = '''
[
{"title": "Android", "interests": [{"id": 1, "title": "Jetpack Compose"}, {"id": 2, "title": "Kotlin"}, {"id": 3, "title": "Jetpack"}]},
{"title": "Programming", "interests": [{"id": 4, "title": "Kotlin"}, {"id": 5, "title": "Declarative UIs"}, {"id": 6, "title": "Java"}, {"id": 7, "title": "Unidirectional Data Flow"}, {"id": 8, "title": "C++"}]},
{"title": "Technology", "interests": [{"id": 9, "title": "Pixel"}, {"id": 10, "title": "Google"}]}
]
''';

const String fakePeopleInterestJson = '''
[
{"id": 11, "title": "Kobalt Toral"},
{"id": 12, "title": "K'Kola Uvarek"},
{"id": 13, "title": "Kris Vriloc"},
{"id": 14, "title": "Grala Valdyr"},
{"id": 15, "title": "Kruel Valaxar"},
{"id": 16, "title": "L'Elij Venonn"},
{"id": 17, "title": "Kraag Solazarn"},
{"id": 18, "title": "Tava Targesh"},
{"id": 19, "title": "Kemarrin Muuda"}
]
''';

const String fakePublicationInterestJson = '''
[
{"id": 20, "title": "Kotlin Vibe"},
{"id": 21, "title": "Compose Mix"},
{"id": 22, "title": "Compose Breakdown"},
{"id": 23, "title": "Android Pursue"},
{"id": 24, "title": "Kotlin Watchman"},
{"id": 25, "title": "Jetpack Ark"},
{"id": 26, "title": "Composeshack"},
{"id": 27, "title": "Jetpack Point"},
{"id": 28, "title": "Compose Tribune"}
]
''';
