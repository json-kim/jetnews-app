import 'package:jet_news_app/core/result/result.dart';

abstract class UseCase<DataType, ParamType> {
  Future<Result<DataType>> call(ParamType param);
}
