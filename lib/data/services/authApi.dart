import 'dart:convert';
import 'dart:io';
import 'dart:js_interop';

import 'package:http/http.dart' as http;

import 'package:flutter_task/data/models/login_response.dart';
import 'package:flutter_task/utils/result.dart';

import '../models/login_request.dart';

class AuthApi{
const AuthApi();
Future<Result<LoginResponse>> login(LoginRequest request) async{
  final body = {
"Value": {
  request.toJson()
  }
  };
  try {
    /*HttpClient client = new HttpClient();
    var res= await client.postUrl(Uri.parse("http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/CheckDeliveryLogin"));
    res.headers.add("Content-Type", "application/json");
    res.write(jsonEncode(body));
    var response = await res.close();
    final stringData = await response.transform(utf8.decoder).join();
    final json = jsonDecode(stringData) as List<dynamic>;
    return Result.ok(
       LoginResponse(userId: request.deliveryNo, body: json.toString()),
    );*/

    //
    http.Response response = await http.post(Uri.parse(
        "http://mdev.yemensoft.net:8087/OnyxDeliveryService/Service.svc/CheckDeliveryLogin"),
      headers: {"Content-Type": "application/json"},

      body: jsonEncode(body),
    );

    print(response.body+ "\n " + response.statusCode.toString() + " \n" +
        response.request.toString());

    LoginResponse loginResponse = LoginResponse.fromJson(
        {"body": response.body, "userId": request.deliveryNo});
    return Result.ok(loginResponse);
  }on Exception catch( e){
    return Result.error(e);
  }



}
}