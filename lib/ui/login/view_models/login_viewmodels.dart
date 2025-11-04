import 'package:flutter_task/data/repository/auth_repository.dart';


import '../../../data/models/login_request.dart';
import '../../../utils/command.dart';
import '../../../utils/result.dart';
class loginViewModels  {
  loginViewModels({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository{
    login = Command1<void,LoginRequest>(_login);
  }
  final AuthRepository _authRepository;
  late Command1 login;
  Future<Result<void>> _login(LoginRequest credentials) async {


      final result = await _authRepository.login(credentials.deliveryNo, credentials.password);
      return result;
  }

}