class Author {
  final String name;
  final String url;

  Author({
    required this.name,
    required this.url,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(name: json['name'] as String, url: json['url'] as String);
  }
}
