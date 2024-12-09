import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  

  void login(String Email, String Password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': Email,
        'password': Password,
      });
      if (response.statusCode == 200) {


        Map<String, dynamic> responseBody = jsonDecode(response.body);
        print('Succesfull ${responseBody['token']}');
      } else {

        Map<String, dynamic> errorBody = jsonDecode(response.body);
        print('Login Failed: ${errorBody['error']}');
      }
    } catch (e) {
      print(e.toString());

    }
  }
}
