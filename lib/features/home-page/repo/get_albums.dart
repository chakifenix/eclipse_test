import 'package:dio/dio.dart';

class GetAlbums {
  Dio dio = Dio();
  getAlbums() async {
    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/albums');
      return response;
    } catch (e) {
      print(e);
    }
  }
}
