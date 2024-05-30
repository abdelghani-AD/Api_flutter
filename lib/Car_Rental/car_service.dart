import 'dart:convert';
import 'package:api_flutter/Car_Rental/car.dart';
import 'package:http/http.dart' as http;

class CarService {
  static const String url = 'https://my-json-server.typicode.com/abdelghani-AD/Rest_Api/posts';

  static Future<List<Car>> getCars() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Car> cars = body.map((dynamic item) => Car.fromJson(item)).toList();
      return cars;
    } else {
      throw Exception('Failed to load cars');
    }
  }
}
