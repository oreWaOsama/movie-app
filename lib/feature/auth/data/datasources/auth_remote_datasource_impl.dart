import 'package:dio/dio.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  static const String baseUrl = 'https://route-movie-apis.vercel.app';
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<Map<String, dynamic>> login(LoginRequestModel model) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: model.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      String message = 'Failed to login';
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          if (data['message'] is List) {
            message = (data['message'] as List).join(', ');
          } else {
            message = data['message'].toString();
          }
        } else {
          message = data.toString();
        }
      } else if (e.message != null) {
        message = e.message!;
      }
      throw Exception(message);
    }
  }

  @override
  Future<Map<String, dynamic>> register(RegisterRequestModel model) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: model.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      String message = 'Failed to register';
      if (e.response != null && e.response?.data != null) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          if (data['message'] is List) {
            message = (data['message'] as List).join(', ');
          } else {
            message = data['message'].toString();
          }
        } else {
          message = data.toString();
        }
      } else if (e.message != null) {
        message = e.message!;
      }
      throw Exception(message);
    }
  }
}
