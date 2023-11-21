import 'package:dio/dio.dart';

class GetPerson {
  Dio dio = Dio();
  getPerson() async {
    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      return response;
    } catch (e) {
      print(e);
    }
  }
}
