import 'author.dart';
import 'paragraph.dart';
import 'publication.dart';

class News {
  final String id;
  final String title;
  final String subtitle;
  final String url;
  final int imageId;
  final int imageThumbId;
  final String date;
  final int readTimeMinutes;
  final Publication publication;
  final Author author;
  final List<Paragraph> paragraphs;

  News({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.imageId,
    required this.imageThumbId,
    required this.date,
    required this.readTimeMinutes,
    required this.publication,
    required this.author,
    required this.paragraphs,
  });
}
