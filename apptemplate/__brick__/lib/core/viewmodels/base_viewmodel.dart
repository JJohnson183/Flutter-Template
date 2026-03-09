// This file is used as a base viewmodel for all viewmodels in the project to keep all basic state 
// management logic the same, and to consistantly handle notifying 

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:{{app_name}}/core/errors/app_error.dart';
import 'package:{{app_name}}/core/errors/result.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  Object? _errorCode;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Object? get errorCode => _errorCode;

  //=============================================//
  //============ Error management ===============//
  // Sets error state from a Result, returns true if result was an error
  @protected
  bool setErrorIfAny<T, E extends AppError>(Result<T, E> result, {String? messageOverride}) {
    if (result.isErr) {
      _errorMessage = messageOverride ?? result.err!.message;
      _errorCode = result.err!.code;
      return true;
    }
    return false;
  }

  @protected
  void setError(String message, [Object? code, bool notify = false]) {
    _errorMessage = message;
    _errorCode = code;
    if (notify) scheduleNotify();
  }

  @protected
  void clearErrors() {
    if (_errorMessage == null && _errorCode == null) return;
    _errorMessage = null;
    _errorCode = null;
  }

  //=============================================//
  //=========== Loading / notifying ===========//

  @protected
  void setLoading(bool value) {
    if (_isLoading == value) return;
    _isLoading = value;
    scheduleNotify();
  }

  // Notifies listeners safely, deferring if called during an active frame phase
  @protected
  void scheduleNotify() {
    if (!hasListeners) return;
    final phase = WidgetsBinding.instance.schedulerPhase;
    if (phase == SchedulerPhase.persistentCallbacks || phase == SchedulerPhase.transientCallbacks) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (hasListeners) notifyListeners();
      });
    } else {
      notifyListeners();
    }
  }

  //=============================================//
  //============ Helper methods ===============//
  // Wraps an async operation with loading state and error reset
  @protected
  Future<T> runWithLoading<T>(Future<T> Function() body, {bool notify = true}) async {
    try {
      clearErrors();
      if (notify) setLoading(true);
      return await body();
    } finally {
      if (notify) setLoading(false);
    }
  }
}