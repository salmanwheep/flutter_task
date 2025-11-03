import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_task/data/models/login_response.dart';
import 'package:flutter_task/utils/result.dart';

import '../../models/login_request.dart';

class AuthApi {
  const AuthApi();

  Future<Result<LoginResponse>> login(LoginRequest request) async {
    final body = {
      "Value": {request.toJson()},
    };

    try {
      http.Response response = await http.post(
        Uri.parse(
          "http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/CheckDeliveryLogin",
        ),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print(
        response.body +
            "\n " +
            response.statusCode.toString() +
            " \n" +
            response.request.toString(),
      );

      LoginResponse loginResponse = LoginResponse.fromJson({
        "body": response.body,
        "userId": request.deliveryNo,
      });
      return Result.ok(loginResponse);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
