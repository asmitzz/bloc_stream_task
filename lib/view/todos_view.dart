import 'package:bloc_stream_task/bloc/todos_bloc.dart';
import 'package:bloc_stream_task/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<TodosBloc, List<TodosModel>>(
          builder: (context, todos) {
            return todos.isEmpty
                ? const Text("No todos found")
                : ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = (todos)[index];
                      return Card(
                        margin: const EdgeInsets.all(16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Checkbox(
                                value: todo.isComplete,
                                onChanged: (value) => {},
                              ),
                              Text(todo.title),
                              IconButton(
                                  onPressed: () =>
                                      BlocProvider.of<TodosBloc>(context)
                                          .add(DeleteTodos(todoId: todo.id)),
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => BlocProvider.of<TodosBloc>(context).add(AddTodos(
              newTodo: TodosModel(
                  id: UniqueKey().toString(),
                  title: "Learn css",
                  isComplete: false))),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
