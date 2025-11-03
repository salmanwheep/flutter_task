import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_task/data/models/login_response.dart';
import 'package:flutter_task/data/services/api/authApi.dart';
import 'package:flutter_task/utils/result.dart';

import '../models/login_request.dart';

class AuthRepository extends ChangeNotifier{
  AuthRepository({required AuthApi authApi}):_authApi=authApi;
  final AuthApi _authApi;



  bool isAuth=false;

  Future<Result<void>> login(int userId,String password)async {
    try {
      final response = await _authApi.login(
          LoginRequest(deliveryNo: userId, password: password, languageNo: 2));

      isAuth = true;

      switch (response) {
        case Ok<LoginResponse>():
          return Result.ok(null);
        case Error<LoginResponse>():
          return Result.error(response.error);
      }
    } finally {
      notifyListeners();
    }
  }
}

