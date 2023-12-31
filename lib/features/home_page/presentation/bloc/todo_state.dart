import 'package:equatable/equatable.dart';
import 'package:todo_app/features/home_page/presentation/bloc/status.dart';

class ToDoState extends Equatable {
  final Status status;

  const ToDoState({required this.status});

  ToDoState copyWith({
    Status? newStatus,
  }) {
    return ToDoState(status: newStatus ?? status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
