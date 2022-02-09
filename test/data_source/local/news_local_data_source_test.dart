import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:jet_news_app/data/data_source/local/news_local_data_source.dart';

void main() {
  group('news local data source 를 테스트합니다.', () {
    Hive.init('path');
    final localDataSource = NewsLocalDataSource();

    test('hive test', () async {
      var myBox = await Hive.openBox<String>('testBox');
      await myBox.clear();
      myBox.add('test1');
      myBox.add('test2');
      myBox.put('key', 'value');

      final values = myBox.values.toList();
      expect(['test1', 'test2', 'value'], values);
    });

    test('북마크, 좋아요 등록 테스트', () async {
      // 북마크 등록
      final bookmark = await localDataSource.bookmarkNews('spiderman');
      expect(
          true, bookmark.whenOrNull(success: (isBookmarked) => isBookmarked));

      // 북마크 해제
      final unBookmark = await localDataSource.bookmarkNews('spiderman');
      expect(false,
          unBookmark.whenOrNull(success: (isBookmarked) => isBookmarked));

      // 좋아요 등록
      final favorite = await localDataSource.favoriteNews('spiderman');
      expect(true, favorite.whenOrNull(success: (isFavorite) => isFavorite));

      // 좋아요 해제
      final unFavorite = await localDataSource.favoriteNews('spiderman');
      expect(false, unFavorite.whenOrNull(success: (isFavorite) => isFavorite));
    });

    test('북마크 가져오기', () async {
      // news1, news2 등록하고 가져와서 비교
      await localDataSource.bookmarkNews('news1');
      await localDataSource.bookmarkNews('news2');
      final result = await localDataSource.getBookmarks();

      result.when(success: (success) {
        expect(success, ['news1', 'news2']);
      }, error: (message) {
        print(message);
      });
    });

    test('좋아요 가져오기', () async {
      // news1, news2 등록하고 가져와서 비교
      await localDataSource.favoriteNews('news1');
      await localDataSource.favoriteNews('news2');
      final result = await localDataSource.getFavorite();

      result.when(success: (success) {
        expect(success, ['news1', 'news2']);
      }, error: (message) {
        print(message);
      });
    });
  });
}
