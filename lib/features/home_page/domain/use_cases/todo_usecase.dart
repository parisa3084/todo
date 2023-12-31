import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/core/usecase/use_case.dart';
import 'package:todo_app/features/home_page/data/models/todo_model.dart';
import 'package:todo_app/features/home_page/domain/repository/todo_repository.dart';

class ToDoUseCase implements UseCase<DataState<ToDo>, NoParams> {
  final ToDoRepository _toDoRepository;

  ToDoUseCase(this._toDoRepository);

  @override
  Future<DataState<ToDo>> call(NoParams? noParams) {
    return _toDoRepository.getToDoList();
  }
}
