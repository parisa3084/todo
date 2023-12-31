import 'package:dio/dio.dart';
import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/features/home_page/data/data_source/remote/api_provider.dart';
import 'package:todo_app/features/home_page/data/models/todo_model.dart';
import 'package:todo_app/features/home_page/domain/repository/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  ApiProvider apiProvider;

  ToDoRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<ToDo>> getToDoList() async {
    try {
      Response response = await apiProvider.getToDoList();
      if (response.statusCode == 200) {
        ToDo toDo = ToDo.fromJson(response.data);

        return DataSuccess(toDo);
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }
}
