import '../../data/models/register_request_model.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Map<String, dynamic>> call(RegisterRequestModel model) {
    return repository.register(model);
  }
}
