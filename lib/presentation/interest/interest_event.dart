import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jet_news_app/domain/usecase/interest/data/interest_data.dart';

part 'interest_event.freezed.dart';

@freezed
class InterestEvent with _$InterestEvent {
  const factory InterestEvent.loadInterest() = LoadInterest;
  const factory InterestEvent.checkInterest(InterestData interestData) =
      CheckInterest;
}
