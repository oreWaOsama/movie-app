import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  /// Shows a Flushbar error for Dio or general errors.
  static void showError(BuildContext context, dynamic error,
      {String? fallbackMessage}) {
    String message = fallbackMessage ?? 'An error occurred';
    if (error is DioException) {
      if (error.response?.data is Map &&
          error.response?.data['message'] != null) {
        message = error.response?.data['message']?.toString() ??
            (fallbackMessage ?? 'An error occurred');
      } else if (error.message != null) {
        message = error.message!;
      }
    } else if (error is Exception || error is String) {
      message = error.toString();
    }
    Flushbar(
      message: message,
      backgroundColor: Colors.red.shade700,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error, color: Colors.white),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  /// Shows a Flushbar success message.
  static void showSuccess(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: Colors.green.shade700,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.check_circle, color: Colors.white),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
