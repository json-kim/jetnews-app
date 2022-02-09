import 'package:hive/hive.dart';
import 'package:jet_news_app/core/result/result.dart';

class InterestLocalDataSource {
  Future<Result<bool>> checkInterest(int interestId) async {
    try {
      final interestBox = await Hive.openBox<int>('interest');

      if (interestBox.containsKey(interestId)) {
        interestBox.delete(interestId);
        return const Result.success(false);
      } else {
        interestBox.put(interestId, interestId);
        return const Result.success(true);
      }
    } catch (e) {
      return Result.error('$runtimeType.checkInterest : 에러 발생 \n$e');
    }
  }

  Future<Result<List<int>>> getCheckedInterestId() async {
    try {
      final interestBox = await Hive.openBox<int>('interest');

      final checkedIdList = interestBox.values.toList();

      return Result.success(checkedIdList);
    } catch (e) {
      return Result.error('$runtimeType.getCheckedInterestId : 에러 발생 \n$e');
    }
  }
}
