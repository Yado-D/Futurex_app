import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'welcome_profile_setup_event.dart';
part 'welcome_profile_setup_state.dart';

class WelcomeProfileSetupBloc extends Bloc<WelcomeProfileSetupEvent, WelcomeProfileSetupState> {
  WelcomeProfileSetupBloc() : super(WelcomeProfileSetupState(value: 0, contColor: Colors.white, txtColor: Colors.black54,content: "Grade 10")) {
    on<WelcomeProfileSetupButtonClickedEvent>((event, emit) {
      // TODO: implement event handler
       emit(WelcomeProfileSetupState(
           value: event.value,
           contColor: event.contColor,
           txtColor: event.txxtColor,
           content: event.content,
       ));
    });
  }
}
