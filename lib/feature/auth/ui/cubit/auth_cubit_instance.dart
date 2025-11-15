import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/datasources/auth_remote_datasource_impl.dart';
import 'auth_cubit.dart';

final authCubitInstance = AuthCubit(
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
