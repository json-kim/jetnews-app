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
}

enum MarkupType { link, bold, code, italic }
