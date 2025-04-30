import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'welcome_page_2_event.dart';
part 'welcome_page_2_state.dart';

class WelcomePage2Bloc extends Bloc<WelcomePage2Event, WelcomePage2State> {
  WelcomePage2Bloc() : super(WelcomePage2State()) {
    on<WelcomeProfileSetup2ButtonClickedAddEvent>((event, emit) {
      // TODO: implement event handler
      PreferredSubject subject = PreferredSubject(
        value: event.value,
        contColor: event.contColor,
        txtColor: event.txtColor,
        content: event.content,
      );
      emit(WelcomePage2State().copyWith(
        preferredSelectedSubject: [...?state.preferredSelectedSubject, subject],
        improvedSelectedSubject: [...?state.improvedSelectedSubject],
      ));
    });
    on<WelcomeProfileSetup2ButtonClickedDeleteEvent>((event, emit) {
      // TODO: implement event handler
      emit(WelcomePage2State().copyWith(
        preferredSelectedSubject: event.subjects,
        improvedSelectedSubject: state.improvedSelectedSubject,
      ));
    });

    //improved sub
    on<WelcomeProfileSetup2ImproveButtonClickedAddEvent>((event, emit) {
      // TODO: implement event handler
      PreferredSubject subject = PreferredSubject(
        value: event.value,
        contColor: event.contColor,
        txtColor: event.txtColor,
        content: event.content,
      );
      emit(WelcomePage2State().copyWith(
        improvedSelectedSubject: [...?state.improvedSelectedSubject, subject],
        preferredSelectedSubject: [...?state.preferredSelectedSubject],
      ));
    });
    on<WelcomeProfileSetup2ImproveButtonClickedDeleteEvent>((event, emit) {
      // TODO: implement event handler
      emit(WelcomePage2State().copyWith(
        improvedSelectedSubject: event.subjects,
        preferredSelectedSubject: state.preferredSelectedSubject,
      ));
    });
  }
}
