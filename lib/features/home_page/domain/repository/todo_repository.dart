import 'package:todo_app/features/home_page/data/models/todo_model.dart';

import '../../../../core/resources/data_state.dart';

abstract class ToDoRepository {
  Future<DataState<ToDo>> getToDoList();
}
