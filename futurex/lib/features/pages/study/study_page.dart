import 'dart:async';
import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PomodoroTimerPage extends StatefulWidget {
  const PomodoroTimerPage({super.key});

  @override
  State<PomodoroTimerPage> createState() => _PomodoroTimerPageState();
}

class _PomodoroTimerPageState extends State<PomodoroTimerPage> {
  static const int _focusDuration = 25 * 60; // 25 minutes in seconds
  static const int _breakDuration = 25 * 60; // 5 minutes in seconds
  int _remainingSeconds = _focusDuration;
  bool _isRunning = false;
  bool _isFocusTime = false; // Track focus or break time
  Timer? _timer;

  String get _formattedTime {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get _progress {
    // Calculate progress based on current focus/break duration
    final int currentDuration = _isFocusTime ? _focusDuration : _breakDuration;
    return 1.0 - (_remainingSeconds / currentDuration);
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _stopTimer();
          _startBreakTimer(); // Start break timer when focus time ends
        }
      });
    });
  }

  void _startBreakTimer() {
    setState(() {
      _isFocusTime = false; // Switch to break time
      _remainingSeconds = _breakDuration;
    });
    _startTimer(); // Reuse _startTimer to start the break timer
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _isFocusTime = true; // Reset to focus time
      _remainingSeconds = _focusDuration;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableText(
              TextColor: ColorCollections.Black,
              FromTop: 10,
              FromBottom: 10,
              TextString: "Study Session",
              FontSize: 25,
              TextFontWeight: FontWeight.bold,
            ),
            ReusableText(
              FromTop: 0,
              FromBottom: 100,
              TextString: _isFocusTime
                  ? 'Focus for 25 minutes'
                  : 'Take a break for 5 minutes',
              FontSize: 18,
              TextColor: Colors.grey.shade700,
            ),
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 8.0,
              percent: _progress,
              circularStrokeCap: CircularStrokeCap.round,
              center: ReusableText(
                TextString: _formattedTime,
                FontSize: 48,
                TextColor: ColorCollections.Black,
              ),
              progressColor: _isFocusTime
                  ? Colors.blue
                  : Colors.green, // Change color based on focus/break
              backgroundColor: Colors.blue.shade100,
            ),
            _isFocusTime
                ?
                Column(
                    children: [
                      const SizedBox(height: 40.0),
                      reusableButtonContainer(
                          context,
                          _isRunning ? 'Pause' : 'Start',
                          Colors.blue,
                          Colors.white),
                      const SizedBox(height: 10.0),
                      reusableButtonContainer(
                          context, "Reset", Colors.white, Colors.black54),
                    ],
                  ): BreakTimeWidget()
          ],
        ),
      ),
    );
  }

  Widget reusableButtonContainer(
      BuildContext context, String content, Color contColor, Color txtColor) {
    return InkWell(
      onTap: () {
        if (content == "Reset") {
          _resetTimer();
        } else {
          _isRunning ? _stopTimer() : _startTimer();
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 3, left: 3),
        height: 55,
        // width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: contColor,
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: ReusableText(
            TextColor: txtColor,
            // FromLeft: 15,
            FromRight: 10,
            // FromTop: 50,
            TextString: content,
            FontSize: 18,
            // TextFontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget BreakTimeWidget() {
    return Column(
      children: [
        ReusableText(
          TextColor: ColorCollections.Black,
          FromTop: 10,
          FromBottom: 10,
          TextString: "Break Time!",
          FontSize: 25,
          TextFontWeight: FontWeight.bold,
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.shade100,
          ),
          child: Center(
            child: ReusableText(
              TextColor: Colors.blue,
              FromTop: 10,
              FromBottom: 10,
              TextString: "Do 5 Push-ups",
              FontSize: 20,
              TextFontWeight: FontWeight.bold,
            ),
          ),
        ),
        ReusableText(
          TextColor: ColorCollections.Black,
          FromTop: 10,
          FromBottom: 0,
          TextString: "Take a short break before your next session",
          FontSize: 15,
          TextFontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 20.0),
        reusableButtonContainer(context, 'Start New Session', Colors.blue, Colors.white),
        const SizedBox(height: 10.0),
        reusableButtonContainer(context, "Back To Dashboard", Colors.white, Colors.black54),
      ],
    );
  }
}
