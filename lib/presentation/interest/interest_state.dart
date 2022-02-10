import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_news_app/domain/usecase/interest/data/interest_data.dart';

part 'interest_state.freezed.dart';

@freezed
class InterestState with _$InterestState {
  const factory InterestState({
    InterestSet? interestSet,
    @Default(false) isLoading,
  }) = _InterestState;
}
