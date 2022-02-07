import 'package:jet_news_app/domain/model/interest/interest.dart';
import 'package:jet_news_app/domain/model/interest/interest_section.dart';

class InterestData {
  final Interest interest;
  final bool isChecked;

  InterestData({required this.interest, required this.isChecked});

  InterestData copyWith({Interest? interest, bool? isChecked}) {
    return InterestData(
        interest: interest ?? this.interest,
        isChecked: isChecked ?? this.isChecked);
  }
}

class InterestSectionData {
  final String title;
  final List<InterestData> interests;

  InterestSectionData(this.title, this.interests);

  factory InterestSectionData.build(InterestSection section, List<int> ids) {
    final interests = section.interests
        .map((e) => InterestData(interest: e, isChecked: ids.contains(e.id)))
        .toList();
    return InterestSectionData(section.title, interests);
  }
}

class InterestSet {
  final List<InterestSectionData> interestSections;
  final List<InterestData> peopleInterests;
  final List<InterestData> pubInterests;

  InterestSet(this.interestSections, this.peopleInterests, this.pubInterests);

  factory InterestSet.build(List<InterestSection> sections,
      List<Interest> peoples, List<Interest> pubs, List<int> ids) {
    final interestSections =
        sections.map((e) => InterestSectionData.build(e, ids)).toList();
    final peopleInterests = peoples
        .map((e) => InterestData(interest: e, isChecked: ids.contains(e.id)))
        .toList();
    final pubInterests = pubs
        .map((e) => InterestData(interest: e, isChecked: ids.contains(e.id)))
        .toList();

    return InterestSet(interestSections, peopleInterests, pubInterests);
  }
}
