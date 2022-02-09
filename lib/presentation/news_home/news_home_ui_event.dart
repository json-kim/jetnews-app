import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_home_ui_event.freezed.dart';

@freezed
class NewsHomeUiEvent with _$NewsHomeUiEvent {
  const factory NewsHomeUiEvent.showSnackBar(String message) = ShowSnackBar;
}
