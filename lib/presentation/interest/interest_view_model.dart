import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jet_news_app/domain/model/interest/interest.dart';
import 'package:jet_news_app/domain/usecase/interest/data/interest_data.dart';
import 'package:jet_news_app/domain/usecase/interest/interest_check_use_case.dart';
import 'package:jet_news_app/domain/usecase/interest/interest_load_use_case.dart';
import 'package:jet_news_app/presentation/interest/interest_event.dart';
import 'package:jet_news_app/presentation/interest/interest_ui_event.dart';

import 'interest_state.dart';

class InterestViewModel with ChangeNotifier {
  final InterestLoadUseCase _interestLoadUseCase;
  final InterestCheckUseCase _interestCheckUseCase;

  InterestViewModel(this._interestLoadUseCase, this._interestCheckUseCase) {
    _loadInterest();
  }

  InterestState _state = InterestState();
  InterestState get state => _state;

  final StreamController<InterestUiEvent> _streamController =
      StreamController<InterestUiEvent>.broadcast();
  Stream<InterestUiEvent> get uiStream => _streamController.stream;

  int _page = 0;

  void onEvent(InterestEvent event) {
    event.when(loadInterest: _loadInterest, checkInterest: _checkInterest);
  }

  Future<void> _loadInterest() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _interestLoadUseCase(_page);

    result.when(success: (interestSet) {
      _state = _state.copyWith(interestSet: interestSet);
      _page++;
    }, error: (message) {
      // 가져오기 실패, 스낵바
      debugPrint(message);
    });

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  Future<void> _checkInterest(InterestData interestData) async {
    final interestSet = _state.interestSet;
    if (interestSet == null) {
      return;
    }

    final result = await _interestCheckUseCase(interestData.interest.id);

    result.when(success: (isChecked) {
      switch (interestData.interest.category) {
        case InterestCategory.topic:
          final interests = interestSet.interestSections
              .singleWhere(
                  (section) => section.interests.contains(interestData))
              .interests;
          final index = interests.indexOf(interestData);
          interests[index] = interestData.copyWith(isChecked: isChecked);

          _state = _state.copyWith(interestSet: interestSet);
          break;

        case InterestCategory.people:
          final interests = interestSet.peopleInterests;
          final index = interests.indexOf(interestData);
          interests[index] = interestData.copyWith(isChecked: isChecked);

          _state = _state.copyWith(interestSet: interestSet);
          break;
        case InterestCategory.publication:
          final interests = interestSet.pubInterests;
          final index = interests.indexOf(interestData);
          interests[index] = interestData.copyWith(isChecked: isChecked);

          _state = _state.copyWith(interestSet: interestSet);
          break;
      }
    }, error: (message) {
      // 체크 실패, 스낵바
      debugPrint(message);
    });

    notifyListeners();
  }
}
