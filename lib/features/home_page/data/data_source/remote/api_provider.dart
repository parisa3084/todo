import 'package:dio/dio.dart';
import 'package:todo_app/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> getToDoList() async {
    var response = await _dio.get(
      '${Constants.baseUrl}/d09936d7-4985-4e3e-904f-88fc80232e6e',
    );
    return response;
  }
}
