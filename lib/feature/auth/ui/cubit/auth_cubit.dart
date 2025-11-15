import 'package:bloc/bloc.dart';
import 'package:new_movie_app/feature/auth/ui/cubit/auth_state.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/register_request_model.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit({required this.loginUseCase, required this.registerUseCase})
      : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await loginUseCase(
          LoginRequestModel(email: email, password: password));
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  }) async {
    emit(AuthLoading());
    try {
      final result = await registerUseCase(RegisterRequestModel(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        avaterId: avaterId,
      ));
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
