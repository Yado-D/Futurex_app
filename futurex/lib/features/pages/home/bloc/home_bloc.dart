import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeTodoButtonClickEvent>((event, emit) {
      // TODO: implement event handler
      TodoObject todo = TodoObject(todo: event.is_todo_done, index: event.index);
      if(event.todo!=null){
        emit(HomeState(todo: event.todo));
      }else{
        emit(HomeState(todo: [...?state.todo,todo]));
      }
    });
  }
}

class TodoObject{
  bool? todo;
  int? index;
  TodoObject({
    required this.todo,
    required this.index
});
}