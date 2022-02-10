import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jet_news_app/data/data_source/fake/interest_fake_data_source.dart';

void main() {
  test('topic 데이터 decode 테스트', () async {
    final jsonMap = jsonDecode(fakeTopicInterestJson);
  });
}
