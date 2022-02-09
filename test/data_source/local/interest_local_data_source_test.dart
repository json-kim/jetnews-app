import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:jet_news_app/data/data_source/local/interest_local_data_source.dart';

void main() {
  group('interest local data source 를 테스트합니다.', () {
    final _localDataSource = InterestLocalDataSource();
    Hive.init('path');

    test('check interest', () async {
      final myBox = await Hive.openBox<int>('interest');
      await myBox.clear();

      final result1 = await _localDataSource.checkInterest(1);
      result1.when(success: (isChecked) {
        expect(isChecked, true);
      }, error: (message) {
        print(message);
      });

      final result2 = await _localDataSource.checkInterest(1);
      result2.when(success: (isChecked) {
        expect(isChecked, false);
      }, error: (message) {
        print(message);
      });
    });

    test('get checked interest test', () async {
      await _localDataSource.checkInterest(1);
      await _localDataSource.checkInterest(2);
      final result = await _localDataSource.getCheckedInterestId();

      return result.when(success: (list) {
        expect(list, [1, 2]);
      }, error: (message) {
        print(message);
      });
    });
  });
}
