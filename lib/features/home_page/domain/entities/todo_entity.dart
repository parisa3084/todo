import 'package:equatable/equatable.dart';
import 'package:todo_app/features/home_page/data/models/todo_model.dart';

class ToDoEntity extends Equatable {
  final int? code;
  final String? errorMessage;
  final List<Data>? data;

  const ToDoEntity({this.data, this.code, this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [data, code, errorMessage];
}
