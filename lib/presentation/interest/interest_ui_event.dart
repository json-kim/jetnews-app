import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest_ui_event.freezed.dart';

@freezed
class InterestUiEvent with _$InterestUiEvent {
  const factory InterestUiEvent.showSnackBar(String message) = ShowSnackBar;
}
