class Publication {
  final String name;
  final String logoUrl;

  Publication({required this.name, required this.logoUrl});

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
        name: json['name'] as String, logoUrl: json['logoUrl'] as String);
  }
}
