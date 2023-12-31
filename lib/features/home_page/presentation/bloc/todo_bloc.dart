import 'package:bloc/bloc.dart';
import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/core/usecase/use_case.dart';
import 'package:todo_app/features/home_page/domain/use_cases/todo_usecase.dart';
import 'package:todo_app/features/home_page/presentation/bloc/status.dart';
import 'package:todo_app/features/home_page/presentation/bloc/todo_state.dart';

part 'todo_event.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ToDoUseCase toDoUseCase;

  ToDoBloc(this.toDoUseCase) : super(ToDoState(status: Loading())) {
    on<LoadToDoEvent>((event, emit) async {
      emit(state.copyWith(newStatus: Loading()));

      DataState dataState = await toDoUseCase(NoParams());
      if (dataState is DataSuccess) {
        emit(state.copyWith(newStatus: Completed(dataState.data)));
      }

      if (dataState is DataFailed) {
        emit(state.copyWith(newStatus: Error(dataState.error!)));
      }
    });
  }
}
