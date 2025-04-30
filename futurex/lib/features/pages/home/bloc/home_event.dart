part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeTodoButtonClickEvent extends HomeEvent{
  bool is_todo_done;
  int? index;
  List<TodoObject>? todo;
  HomeTodoButtonClickEvent({
    this.is_todo_done = false,
    this.index,
    this.todo
});
}