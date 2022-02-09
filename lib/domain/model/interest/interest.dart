class Interest {
  final int id;
  final String title;
  final InterestCategory category;

  Interest({required this.id, required this.title, required this.category});

  factory Interest.fromJson(
      Map<String, dynamic> json, InterestCategory category) {
    return Interest(
        id: json['id'] as int,
        title: json['title'] as String,
        category: category);
  }
}

enum InterestCategory {
  topic,
  people,
  publication,
}
