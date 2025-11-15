import '../../data/models/login_request_model.dart';
import '../../data/models/register_request_model.dart';

abstract class AuthRepository {
  Future<Map<String, dynamic>> login(LoginRequestModel model);
  Future<Map<String, dynamic>> register(RegisterRequestModel model);
}
