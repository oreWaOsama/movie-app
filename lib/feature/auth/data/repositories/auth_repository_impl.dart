import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<String, dynamic>> login(LoginRequestModel model) {
    return remoteDataSource.login(model);
  }

  @override
  Future<Map<String, dynamic>> register(RegisterRequestModel model) {
    return remoteDataSource.register(model);
  }
}
