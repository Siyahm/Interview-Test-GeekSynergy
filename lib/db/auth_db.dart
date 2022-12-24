import 'dart:developer';

import 'package:api_test/config/app_exceptions.dart';
import 'package:api_test/helpers/app_colors.dart';
import 'package:api_test/model/user_model.dart';
import 'package:api_test/utils/app_pop_up.dart';
import 'package:hive/hive.dart';

class AuthDB {
  Future<UserModel?> userExist(UserModel userModel) async {
    try {
      final userDB = await Hive.openBox<UserModel>('USER_DB');
      List<UserModel> user = userDB.values.toList();
      for (var element in user) {
        if (element.email == userModel.email) {
          return element;
        }
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<bool> signUp(UserModel userModel) async {
    try {
      final userDB = await Hive.openBox<UserModel>('USER_DB');
      final existUser = await userExist(userModel);
      if (existUser != null) {
        AppPopUps.showToast('User already exist', AppColors.errorColor);
        return false;
      } else {
        AppPopUps.showToast(
            'User registered successfully', AppColors.successColor);
        userDB.add(userModel);
        log(userDB.values.toString());
        return true;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }

  Future<bool> login(UserModel userModel) async {
    try {
      final existUser = await userExist(userModel);
      if (existUser != null && existUser.password == userModel.password) {
        return true;
      } else if (existUser == null) {
        AppPopUps.showToast('User not found', AppColors.errorColor);
        return false;
      } else {
        AppPopUps.showToast(
            'Password or Email does not match', AppColors.errorColor);
        return false;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }
}
