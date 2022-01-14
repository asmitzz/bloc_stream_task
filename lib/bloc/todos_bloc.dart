import 'package:bloc/bloc.dart';
import 'package:bloc_stream_task/model/todo_model.dart';
import 'package:meta/meta.dart';

part 'todos_event.dart';

class TodosBloc extends Bloc<TodosEvent, List<TodosModel>> {
  final List<TodosModel> _todos;

  TodosBloc({required List<TodosModel> todos})
      : _todos = todos,
        super(todos) {
    on<AddTodos>(_onAddTodos);
    on<DeleteTodos>(_onDeleteTodos);
  }

  void _onAddTodos(AddTodos event, Emitter<List<TodosModel>> emit) {
    final currentTodos = state;
    currentTodos.add(event.newTodo);
    emit(currentTodos);
  }

  void _onDeleteTodos(DeleteTodos event, Emitter<List<TodosModel>> emit) {
    final currentTodos = state;
    currentTodos.removeWhere((element) => element.id == event.todoId);
    emit(currentTodos);
  }
}
