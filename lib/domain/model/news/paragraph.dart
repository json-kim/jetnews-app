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
