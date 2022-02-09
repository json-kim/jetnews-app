import 'markup.dart';

class Paragraph {
  final String text;
  final ParagraphType type;
  final List<Markup> markups;

  Paragraph({
    required this.text,
    required this.type,
    required this.markups,
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) {
    return Paragraph(
      text: json['text'] ?? '',
      type: parseToParagraphType(json['type'] ?? 'text'),
      markups: json['markups'] == null
          ? []
          : (json['markups'] as List)
              .map((json) => Markup.fromJson(json))
              .toList(),
    );
  }
}

enum ParagraphType {
  text,
  header,
  codeBlock,
  subhead,
  bullet,
  quote,
  title,
  caption
}

ParagraphType parseToParagraphType(String type) {
  if (type == 'Text') {
    return ParagraphType.text;
  } else if (type == 'Header') {
    return ParagraphType.header;
  } else if (type == 'CodeBlock') {
    return ParagraphType.codeBlock;
  } else if (type == 'Subhead') {
    return ParagraphType.subhead;
  } else if (type == 'Bullet') {
    return ParagraphType.bullet;
  } else if (type == 'Quote') {
    return ParagraphType.quote;
  } else if (type == 'Title') {
    return ParagraphType.title;
  } else {
    return ParagraphType.caption;
  }
}
