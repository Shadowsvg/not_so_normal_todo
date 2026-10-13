import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_riverpod/features/todo/application/todos_state.dart';
import 'package:todo_riverpod/features/todo/domain/todo.dart';

part 'todos_controller.g.dart';

@riverpod
class TodosController extends _$TodosController {
  @override
  TodosState build() {
    return TodosState.initial();
  }

  void addTodo(String title) {
    final trimmedTitle = title.trim();
    if (trimmedTitle.isEmpty) return;

    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: trimmedTitle,
      isCompleted: false,
    );
    state = state.copyWith(todos: [...state.todos, todo]);
  }

  void toggleTodo(String id) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.id != id) return todo;
      return todo.copyWith(isCompleted: !todo.isCompleted);
    }).toList();

    state = state.copyWith(todos: updatedTodos);
  }

  void deleteTodo(String id) {
    final updatedTodos = state.todos.where((todo) => todo.id != id).toList();
    state = state.copyWith(todos: updatedTodos);
  }

  void updateTodo(String id, String newTitle) {
    final trimmedTitle = newTitle.trim();
    if (trimmedTitle.isEmpty) return;
    final todoExists = state.todos.any((todo) => todo.id == id);
    if (!todoExists) {
      state = state.copyWith(errorMessage: "Could not update todo.");
      return;
    }
    final updatedTodos = state.todos
        .map(
          (todo) => todo.id == id ? todo.copyWith(title: trimmedTitle) : todo,
        )
        .toList();
    state = state.copyWith(todos: updatedTodos, errorMessage: null);
  }
}
