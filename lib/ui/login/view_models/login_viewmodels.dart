import 'package:flutter_task/data/repository/auth_repository.dart';


import '../../../utils/command.dart';
import '../../../utils/result.dart';
class loginViewModels  {
  loginViewModels({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository{
    login = Command1<void,(int, String)>(_login);
  }
  final AuthRepository _authRepository;
  late Command1 login;
  Future<Result<void>> _login((int userId, String password) credentials) async {
    final (userId,password) = credentials;

      final result = await _authRepository.login(userId, password);
      return result;
  }

}