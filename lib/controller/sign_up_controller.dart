import 'package:api_test/db/auth_db.dart';
import 'package:api_test/helpers/preference_manager.dart';
import 'package:api_test/model/user_model.dart';
import 'package:api_test/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpController with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  AuthDB authDB = AuthDB();
  PreferenceManager manager = PreferenceManager();

  String? dropDownValue;

  List<String> itemList = [
    'Flutter Developer',
    'Graphic Designer',
    'Teacher',
    'Doctor'
  ];

  void signUp(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final UserModel userModel = UserModel(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      mobNum: int.parse(phoneController.text),
      profession: dropDownValue,
    );

    await authDB.signUp(userModel).then((value) {
      if (value == true) {
        manager.setTokenValue(value);
        Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
      }
    });
    isLoading = false;
    notifyListeners();
    clearControllers();
  }

  void goToSignInScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteNames.loginScreen);
  }

  void onChangeDropDownVaue(String newValue) {
    dropDownValue = newValue;
    notifyListeners();
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    dropDownValue = '';
  }
}
