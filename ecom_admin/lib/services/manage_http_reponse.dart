import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response, // the HTTP response form the request
  required BuildContext context, // the context is to show snackbar
  required VoidCallback
  onSuccess, // the callback to execute on successful reponse
}) {
  //switch statement to handle different http statuscode
  switch (response.statusCode) {
    case 200: // 200 indicates a successfull request
      onSuccess();
      break;
    case 400: // 400 indicates bad request
      showSnackBar(context, json.decode(response.body)['message']);
    case 500:
      showSnackBar(
        context,
        json.decode(response.body)['message'] ?? "Internal server error",
      );
      break;
    case 201: // indicates a resource created successfully
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
