import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';

@immutable
abstract class Status extends Equatable{}

class Loading extends Status{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Completed extends Status{
  final ToDo todo;
  Completed(this.todo);

  @override
  // TODO: implement props
  List<Object?> get props => [todo];
}

class Error extends Status{
  final String message;
  Error(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}