import 'dart:developer';

import 'package:api_test/controller/sign_up_controller.dart';
import 'package:api_test/utils/validations.dart';
import 'package:api_test/view/sign_up/widget/drop_down_widget.dart';
import 'package:api_test/widgets/custome_text_field.dart';
import 'package:api_test/widgets/long_button.dart';
import 'package:api_test/widgets/span_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('signup build');

    final size = MediaQuery.of(context).size;
    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: signUpController.formKey,
                child: Consumer<SignUpController>(
                  builder: (context, value, child) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      CustomTextField(
                        text: "Full Name",
                        controller: value.nameController,
                        validation: (p0) => Validations().naemValidation(p0),
                      ),
                      CustomTextField(
                        text: "Email",
                        controller: value.emailController,
                        validation: (p0) => Validations().emailValidation(p0),
                      ),
                      CustomTextField(
                        text: "Password",
                        controller: value.passwordController,
                        validation: (p0) =>
                            Validations().passwordlValidation(p0),
                      ),
                      CustomTextField(
                        text: "Mobile Number",
                        controller: value.phoneController,
                        validation: (p0) => Validations().phoneValidation(p0),
                        keyboard: TextInputType.number,
                      ),
                      const DropDownWidget(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      LongButton(
                        text: 'Sign Up',
                        onTap: () {
                          if (value.formKey.currentState!.validate()) {
                            value.signUp(context);
                          }
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      TextSpanWidget(
                        text: "Already have an account? ",
                        buttonText: 'Sign in',
                        onTap: () {
                          value.goToSignInScreen(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
