import 'package:bloc/bloc.dart';
import 'package:futurex/data/quiz_questions.dart';
import 'package:futurex/models/each_quiz_model.dart';
import 'package:futurex/models/quiz_model.dart';


part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizState.initial()) {
    on<LoadQuestions>((event, emit) {
      emit(state.copyWith(
            questions: Quizs(quizes: quizList.map((quiz)=>Quiz.fromJson(quiz)).toList()),
      ));
    });

    on<AnswerSelected>((event, emit) {
      final currentQuestion = state.questions!.quizes[state.currentIndex];
      final isCorrect = currentQuestion.options[event.answerIndex].correct;

      // Update answer results
      final newAnswerResults = Map<int, bool>.from(state.answerResults);
      newAnswerResults[state.currentIndex] = isCorrect;

      emit(state.copyWith(
        selectedAnswerIndex: event.answerIndex,
        answerResults: newAnswerResults,
        correctAnswersCount: isCorrect
            ? state.correctAnswersCount + 1
            : state.correctAnswersCount,
      ));
    });

    on<NextQuestion>((event, emit) {
      emit(state.copyWith(
        currentIndex: state.currentIndex + 1,
        selectedAnswerIndex: null,
      ));
    });

    on<TryAgainQuizQuestion>((event, emit) {
      emit(state.copyWith(
        currentIndex: 0,
        selectedAnswerIndex: null,
      ));
    });

    on<PreviousQuestion>((event, emit) {
      emit(state.copyWith(
        currentIndex: state.currentIndex - 1,
      ));
    });
  }
}