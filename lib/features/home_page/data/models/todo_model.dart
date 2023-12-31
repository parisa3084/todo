import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_model.freezed.dart';
part 'todo_model.g.dart';



@freezed
class ToDo with _$ToDo {
  const factory ToDo({
    int? code,
    String? errorMessage,
    List<Data>? data
  }) = _ToDo;

  factory ToDo.fromJson(Map<String, Object?> json)
  => _$ToDoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? time,
    String? text,
    String? color
  }) = _Data;
  factory Data.fromJson(Map<String, Object?> json)
  => _$DataFromJson(json);

}