import 'package:flutter/material.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/register_request_model.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthProvider({required this.loginUseCase, required this.registerUseCase});

  bool isLoading = false;
  String? error;
  Map<String, dynamic>? userData;

  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await loginUseCase(
          LoginRequestModel(email: email, password: password));
      userData = result;
      error = null;
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await registerUseCase(RegisterRequestModel(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        avaterId: avaterId,
      ));
      userData = result;
      error = null;
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
