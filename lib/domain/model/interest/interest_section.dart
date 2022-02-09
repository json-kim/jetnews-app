import 'interest.dart';

class InterestSection {
  final String title;
  final List<Interest> interests;

  InterestSection({required this.title, required this.interests});

  factory InterestSection.fromJson(Map<String, dynamic> json) {
    return InterestSection(
        title: json['title'],
        interests: (json['interests'] as List)
            .map((json) => Interest.fromJson(json, InterestCategory.topic))
            .toList());
  }
}
