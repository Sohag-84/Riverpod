import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_tutorial/future_provider/user_model.dart';

class ApiServices {
  String endpoint = "https://reqres.in/api/users?page=2";

  Future<List<Data>> getUser() async {
    http.Response response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => Data.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
