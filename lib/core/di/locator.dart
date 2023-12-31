import 'package:get_it/get_it.dart';
import 'package:todo_app/features/home_page/data/data_source/remote/api_provider.dart';
import 'package:todo_app/features/home_page/data/repository/todo_repository_impl.dart';
import 'package:todo_app/features/home_page/domain/repository/todo_repository.dart';
import 'package:todo_app/features/home_page/domain/use_cases/todo_usecase.dart';
import 'package:todo_app/features/home_page/presentation/bloc/todo_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<ToDoRepository>(ToDoRepositoryImpl(locator()));
  locator.registerSingleton<ToDoUseCase>(ToDoUseCase(locator()));
  locator.registerSingleton<ToDoBloc>(ToDoBloc(locator()));
}
