import '../../data/models/login_request_model.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Map<String, dynamic>> call(LoginRequestModel model) {
    return repository.login(model);
  }
}
