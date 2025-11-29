import 'dart:convert';

import 'package:ecom_app/global_variable.dart';
import 'package:ecom_app/models/user.dart';
import 'package:ecom_app/services/manage_http_reponse.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<void> signUpUsers({
    required context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        fullName: fullName,
        email: email,
        state: '',
        city: '',
        locality: '',
        password: password,
        token: '',
      );

      http.Response response = await http.post(
        Uri.parse('$uri/auth/signUp'),
        body: user.toJSON(), // convert the user object for the request body
        headers: <String, String>{
          // set the headers for the request
          'Content-Type':
              'application/json; charset=UTF-8', // specify the content type json
        },
      );

      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Account has been created ");
        },
      );
    } catch (e) {
      print(e);
    }
  }

  // sign in users function
  Future<void> signInUsers({
    required context,
    required String email,
    required String password,
  }) async {
    http.Response response = await http.post(
      Uri.parse('$uri/auth/signIn'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // handle response
    manageHttpResponse(response: response, context: context, onSuccess: () {});
    try {} catch (e) {
      print(e);
    }
  }
}
