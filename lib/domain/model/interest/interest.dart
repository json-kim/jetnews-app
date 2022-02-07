class Interest {
  final int id;
  final String title;
  final InterestCategory category;

  Interest({required this.id, required this.title, required this.category});
}

enum InterestCategory {
  topic,
  people,
  publication,
}
