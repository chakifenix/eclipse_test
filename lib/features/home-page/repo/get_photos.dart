import 'package:dio/dio.dart';

class GetPhotos {
  Dio dio = Dio();

  getPhotos() async {
    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/photos');
      return response;
    } catch (e) {
      print(e);
    }
  }
}
