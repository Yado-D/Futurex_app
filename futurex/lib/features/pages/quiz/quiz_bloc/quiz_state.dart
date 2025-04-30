part of 'quiz_bloc.dart';

class QuizState {
  final Quizs? questions;
  final int currentIndex;
  final int? selectedAnswerIndex;
  final Map<int, bool> answerResults; // Tracks correct/incorrect answers
  final int correctAnswersCount;

  QuizState({
    this.questions,
    this.currentIndex = 0,
    this.selectedAnswerIndex,
    this.answerResults = const {},
    this.correctAnswersCount = 0,
  });

  factory QuizState.initial() => QuizState();

  QuizState copyWith({
    Quizs? questions,
    int? currentIndex,
    int? selectedAnswerIndex,
    Map<int, bool>? answerResults,
    int? correctAnswersCount,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswerIndex: selectedAnswerIndex,
      answerResults: answerResults ?? this.answerResults,
      correctAnswersCount: correctAnswersCount ?? this.correctAnswersCount,
    );
  }

  bool get isLastQuestion => currentIndex == (questions?.quizes.length ?? 0) - 1;
  bool get isAnswered => selectedAnswerIndex != null;
}