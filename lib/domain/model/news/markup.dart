class Markup {
  final String href;
  final int start;
  final int end;
  final MarkupType type;

  Markup({
    required this.href,
    required this.start,
    required this.end,
    required this.type,
  });

  factory Markup.fromJson(Map<String, dynamic> json) {
    final con = Markup(
      href: json['href'] ?? '',
      start: json['start'] as int,
      end: json['end'] as int,
      type: parseToMarkupType(json['type']),
    );

    return Markup(
      href: json['href'] ?? '',
      start: json['start'] as int,
      end: json['end'] as int,
      type: parseToMarkupType(json['type']),
    );
  }
}

enum MarkupType { link, bold, code, italic }

MarkupType parseToMarkupType(String type) {
  if (type == 'Link') {
    return MarkupType.link;
  } else if (type == 'Bold') {
    return MarkupType.bold;
  } else if (type == 'Code') {
    return MarkupType.code;
  } else {
    return MarkupType.italic;
  }
}
