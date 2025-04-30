import 'dart:async';
import 'package:flutter/foundation.dart';

class PomodoroTimerService extends ChangeNotifier {
  static const int _focusDuration = 25 * 60; // 25 minutes in seconds
  static const int _breakDuration = 5 * 60; // 5 minutes in seconds

  int _remainingSeconds = _focusDuration;
  bool _isRunning = false;
  bool _isFocusTime = true;
  Timer? _timer;

  int get remainingSeconds => _remainingSeconds;
  bool get isRunning => _isRunning;
  bool get isFocusTime => _isFocusTime;

  String get formattedTime {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get progress {
    final int currentDuration = _isFocusTime ? _focusDuration : _breakDuration;
    double progress = 1.0 - (_remainingSeconds / currentDuration);
    return progress.clamp(0.0, 1.0);
  }

  void startTimer() {
    if (_isRunning) return;

    _isRunning = true;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _completeCurrentSession(); // Changed to new method
      }
    });
  }

  void toggleTimerMode() {
    _isFocusTime = !_isFocusTime;
    _remainingSeconds = _isFocusTime ? _focusDuration : _breakDuration;
    notifyListeners();

    if (_isRunning) {
      startTimer();
    }
  }

  void stopTimer() {
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void resetTimer() {
    stopTimer();
    _isFocusTime = true;
    _remainingSeconds = _focusDuration;
    notifyListeners();
  }

  void completeEarly() {
    if (_isFocusTime) {
      _completeCurrentSession();
    } else {
      // If in break time and complete early, just reset to focus time
      toggleTimerMode();
      stopTimer();
    }
  }

  void _completeCurrentSession() {
    stopTimer();
    toggleTimerMode();
    if (_isFocusTime == false) { // If we just switched to break time
      startTimer(); // Automatically start the break timer
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}