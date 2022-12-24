import 'package:api_test/db/auth_db.dart';
import 'package:api_test/helpers/preference_manager.dart';
import 'package:api_test/model/user_model.dart';
import 'package:api_test/routes/route_names.dart';

import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  AuthDB authDB = AuthDB();
  PreferenceManager manager = PreferenceManager();

  void login(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final UserModel userModel = UserModel(
      email: emailController.text,
      password: passwordController.text,
    );

    await authDB.login(userModel).then((value) => {
          if (value == true)
            {
              manager.setTokenValue(value),
              Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen),
            }
        });
    clearControllers();
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  void goToSignUpScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteNames.signUpScreen);
  }
}
