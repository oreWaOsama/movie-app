import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(LoginRequestModel model);
  Future<Map<String, dynamic>> register(RegisterRequestModel model);
}
