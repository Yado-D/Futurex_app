part of 'quiz_bloc.dart';

sealed class QuizEvent {}

/// Event to load quiz questions
class LoadQuestions extends QuizEvent {}

/// Event when user selects an answer
class AnswerSelected extends QuizEvent {
  final int answerIndex;
  AnswerSelected(this.answerIndex);
}

/// Event to move to next question
class NextQuestion extends QuizEvent {}

/// Event to return to previous question
class PreviousQuestion extends QuizEvent {}

/// Event to show results (you can add this if needed)
class ShowResults extends QuizEvent {}

class TryAgainQuizQuestion extends QuizEvent {}

