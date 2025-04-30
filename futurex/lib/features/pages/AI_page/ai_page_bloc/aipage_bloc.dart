import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:futurex/Authentication/chatgpt_chatbot.dart';

part 'aipage_event.dart';
part 'aipage_state.dart';

class AipageBloc extends Bloc<AipageEvent, AipageState> {
  AipageBloc() : super(AipageInitial()) {
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onSendMessage(
      SendMessage event,
      Emitter<AipageState> emit,
      ) async {
    await _processMessage(event.text, emit);
  }

  Future<void> _processMessage(
      String text,
      Emitter<AipageState> emit,
      ) async {
    emit(AipageLoading(state.messages));
    try {

      // Create new messages list
      List<Message> newMessages = List.from(state.messages);
      newMessages.add(Message.user(text));
      emit(AipageSuccess(newMessages));
      emit(AipageLoading(state.messages));
      // Get AI response
      final response = await getOpenRouterResponse(text);

      final reply = response['choices'][0]['message']['content'];

      // Add user question and AI response
      newMessages.add(Message.ai(reply));

      emit(AipageSuccess(newMessages));
    } on SocketException catch (e) {
      emit(AipageError(
        state.messages,
        'No internet connection',
      ));
      print('SocketException: ${e.message}');
    } on TimeoutException {
      emit(AipageError(
        state.messages,
        'Request timed out',
      ));
      print('Request timeout');
    } on HttpException catch (e) {
      emit(AipageError(
        state.messages,
        'API request failed',
      ));
      print('HttpException: ${e.message}');
    } on FormatException catch (e) {
      emit(AipageError(
        state.messages,
        'Invalid API response',
      ));
      print('FormatException: ${e.message}');
    } catch (e, stackTrace) {
      emit(AipageError(
        state.messages,
        'Failed to get AI response',
      ));
      print('Error: $e\nStack trace: $stackTrace');
    }
  }
}