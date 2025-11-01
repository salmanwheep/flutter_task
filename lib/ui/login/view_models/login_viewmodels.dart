import 'package:flutter_task/data/repository/auth_repository.dart';

import '../../../data/services/authApi.dart';
import '../../../utils/result.dart';
class loginViewModels  {
  loginViewModels({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  final AuthRepository _authRepository;

  Future<Result<void>> login(int userId, String password) async {

      final result = await _authRepository.login(userId, password);
      return result;
  }

}