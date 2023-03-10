import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:api_test/helpers/app_colors.dart';
import 'package:api_test/utils/app_pop_up.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class AppExceptions {
  static void handleError(Object exception) {
    if (exception is DioError) {
      if (exception.response?.data['message'] != null) {
        AppPopUps.showToast(
          exception.response!.data["message"],
          AppColors.errorColor,
        );
        return;
      } else if (exception.error is SocketException) {
        AppPopUps.showToast(
            "Please check your connection", AppColors.errorColor);
        return;
      } else if (exception.error is PlatformException) {
        AppPopUps.showToast("Platform Exception", AppColors.errorColor);
        return;
      } else if (exception.type == DioErrorType.cancel) {
        AppPopUps.showToast("Request cancelled", AppColors.errorColor);
        return;
      } else if (exception.type == DioErrorType.connectTimeout) {
        AppPopUps.showToast("Connection time out", AppColors.errorColor);
        return;
      } else if (exception.type == DioErrorType.receiveTimeout) {
        AppPopUps.showToast("Recieve time out", AppColors.errorColor);
        return;
      } else if (exception.type == DioErrorType.sendTimeout) {
        AppPopUps.showToast("Send time out", AppColors.errorColor);
        return;
      } else if (exception.type == DioErrorType.other) {
        AppPopUps.showToast("Error Occured", AppColors.errorColor);
        return;
      } else if (exception.type == DioErrorType.response) {
        AppPopUps.showToast("Response Error occured", AppColors.errorColor);
        return;
      }
    }
    if (exception is SocketException) {
      AppPopUps.showToast("Please check your connection", AppColors.errorColor);
      return;
    }
    if (exception is TimeoutException) {
      AppPopUps.showToast("Time out", AppColors.errorColor);
      return;
    } else if (exception is PlatformException) {
      AppPopUps.showToast(exception.message.toString(), AppColors.errorColor);
      return;
    } else {
      log('other exception');
      AppPopUps.showToast(exception.toString(), AppColors.errorColor);
      log(exception.toString());
      return;
    }
  }
}
