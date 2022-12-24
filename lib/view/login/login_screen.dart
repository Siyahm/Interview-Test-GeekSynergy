import 'package:api_test/controller/login_controller.dart';
import 'package:api_test/helpers/app_colors.dart';
import 'package:api_test/utils/validations.dart';
import 'package:api_test/widgets/custome_text_field.dart';
import 'package:api_test/widgets/long_button.dart';
import 'package:api_test/widgets/span_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController =
        Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: loginController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    CustomTextField(
                      text: "Email",
                      controller: loginController.emailController,
                      validation: (p0) => Validations().emailValidation(p0),
                      perffixIcon: const Icon(Icons.person_outline),
                    ),
                    CustomTextField(
                      text: "Password",
                      controller: loginController.passwordController,
                      validation: (p0) => Validations().passwordlValidation(p0),
                      perffixIcon: const Icon(Icons.lock_outline),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: AppColors.blueColor, fontSize: 16),
                        ),
                      ),
                    ),
                    LongButton(
                      text: 'Log in',
                      onTap: () {
                        if (loginController.formKey.currentState!.validate()) {
                          loginController.login(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    TextSpanWidget(
                      text: "Not registered yet? ",
                      buttonText: 'Sign Up',
                      onTap: () {
                        loginController.goToSignUpScreen(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
