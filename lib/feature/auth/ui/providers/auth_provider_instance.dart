import '../../data/datasources/auth_remote_datasource_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import 'auth_provider.dart';

final authProviderInstance = AuthProvider(
  loginUseCase: LoginUseCase(
    AuthRepositoryImpl(
      AuthRemoteDataSourceImpl(),
    ),
  ),
  registerUseCase: RegisterUseCase(
    AuthRepositoryImpl(
      AuthRemoteDataSourceImpl(),
    ),
  ),
);
