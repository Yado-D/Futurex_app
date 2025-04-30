import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/services/pomodoro_study_provider.dart';
import 'package:futurex/utils/color_collections.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_feature_tour/flutter_feature_tour.dart';
import 'package:provider/provider.dart';

class PomodoroTimerPage extends StatefulWidget {
  const PomodoroTimerPage({super.key});

  @override
  State<PomodoroTimerPage> createState() => _PomodoroTimerPageState();
}

class _PomodoroTimerPageState extends State<PomodoroTimerPage> {
  //instances
  final OnboardingService _onboardingService = OnboardingService();

  //global key
  final GlobalKey studyInfo = GlobalKey();
  final GlobalKey startInfo = GlobalKey();

  void _setupOnboarding() {
    _onboardingService.startOnboarding(context);
    _onboardingService
        .setAnalyticsCallback((String event, Map<String, dynamic> properties) {
      if (kDebugMode) {
        print('Analytics Event: $event, Properties: $properties');
      }
      // Implement your analytics tracking here
    });

    _onboardingService.addFeatureHighlightStep([
      FeatureHighlight(
        targetKey: studyInfo,
        title: 'Study',
        description:
        'This Study page uses the Pomodoro Technique for effective focus 25 min Focused study session 5 min Short break.',
        icon: Icons.timer_outlined,
        shape: HighlightShape.rectangle,
      ),
    ]);

    _onboardingService.addFeatureHighlightStep([
      FeatureHighlight(
        targetKey: startInfo,
        title: 'Start',
        description: 'Click to begin a 25-minute focused session.',
        icon: Icons.rocket_launch_outlined,
        shape: HighlightShape.rectangle,
      ),
    ]);
  }

  void _setTourTheme() {
    _onboardingService.setTheme(FeatureTourTheme(
      overlayColor: Colors.black54,
      highlightColor: Colors.blue,
      cardColor: Colors.grey[800] ?? Colors.grey,
      textColor: Colors.white,
      primaryColor: Colors.blue,
      titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyStyle: const TextStyle(fontSize: 16),
      buttonStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      cornerRadius: 10.0,
      highlightBorderWidth: 2.0,
    ));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupOnboarding();
      _setTourTheme();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;
    final timerService = Provider.of<PomodoroTimerService>(context);

    return Scaffold(
      backgroundColor: themeData.background,
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  TextColor: themeData.primary,
                  FromTop: 10,
                  FromBottom: 10,
                  TextString: "Study Session",
                  FontSize: 25,
                  TextFontWeight: FontWeight.bold,
                ),
                Tooltip(
                  message:
                  'This Study page uses the Pomodoro Technique for effective focus 25 min Focused study session 5 min Short break.',
                  child: IconButton(
                    key: studyInfo,
                    onPressed: () {},
                    icon: Icon(
                      Icons.info,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            ReusableText(
              FromTop: 0,
              FromBottom: 50,
              TextString: timerService.isFocusTime
                  ? 'Focus for 25 minutes'
                  : 'Take a break for 5 minutes',
              FontSize: 18,
              TextColor: themeData.onPrimary,
            ),
            const SizedBox(height: 80),

            // Timer Progress Indicator
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 8.0,
              percent: timerService.progress,
              circularStrokeCap: CircularStrokeCap.round,
              center: ReusableText(
                TextString: timerService.formattedTime,
                FontSize: 48,
                TextColor: themeData.primary,
              ),
              progressColor: timerService.isFocusTime ? Colors.blue : Colors.green,
              backgroundColor: Colors.blue.shade100,
            ),

            const SizedBox(height: 10),
            timerService.isFocusTime
                ? timerService.isRunning
                ? Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                          context, "Pause", Colors.blue, Colors.white,
                          onTap: () => timerService.stopTimer()),
                    ),
                    Expanded(
                      child: _buildActionButton(
                          context, 'Reset', Colors.white, Colors.black,
                          onTap: () => timerService.resetTimer()),
                    ),
                  ],
                ),
                _buildActionButton(
                    context, 'Complete Early', Colors.white, Colors.black,
                    onTap: () => timerService.completeEarly()),
              ],
            )
                : Column(
              children: [
                const SizedBox(height: 40.0),
                Container(
                  key: !timerService.isRunning ? startInfo : null,
                  child: _buildActionButton(
                      context,
                      timerService.isRunning ? 'Pause' : 'Start',
                      Colors.blue,
                      Colors.white,
                      onTap: () => timerService.isRunning
                          ? timerService.stopTimer()
                          : timerService.startTimer()),
                ),
                const SizedBox(height: 10.0),
              ],
            )
                : _buildBreakTimeWidget(context, timerService),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context,
      String content,
      Color contColor,
      Color txtColor, {
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minWidth: double.infinity),
        margin: const EdgeInsets.only(top: 20, right: 3, left: 3),
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: contColor,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            content == "Pause"
                ? Icon(Icons.pause, color: Colors.white)
                : content == "Start"
                ? Icon(Icons.play_arrow, color: Colors.white)
                : content == "Complete Early"
                ? Icon(Icons.check, color: Colors.blue)
                : const SizedBox(),
            const SizedBox(width: 10),
            Center(
              child: ReusableText(
                TextColor: txtColor,
                FromRight: 10,
                TextString: content,
                FontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakTimeWidget(
      BuildContext context, PomodoroTimerService timerService) {
    return Column(
      children: [
        ReusableText(
          TextColor: ColorCollections.TeritiaryColor,
          FromTop: 10,
          FromBottom: 10,
          TextString: "Break Time!",
          FontSize: 25,
          TextFontWeight: FontWeight.bold,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          height: 80,
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
          TextColor: ColorCollections.TeritiaryColor,
          FromTop: 10,
          FromBottom: 0,
          TextString: "Take a short break before your next session",
          FontSize: 15,
          TextFontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 20.0),
        _buildActionButton(
            context, 'Start New Session', Colors.blue, Colors.white,
            onTap: () {
              timerService.resetTimer();
              timerService.startTimer();
            }),
        const SizedBox(height: 10.0),
        _buildActionButton(
            context, "Back To Dashboard", Colors.white, Colors.black54,
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/index_page", (predicate) => true);
            }),
      ],
    );
  }
}