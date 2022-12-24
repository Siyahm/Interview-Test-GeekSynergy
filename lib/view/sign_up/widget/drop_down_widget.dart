import 'package:api_test/controller/sign_up_controller.dart';
import 'package:api_test/helpers/app_colors.dart';
import 'package:api_test/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: size.height * 0.08,
        color: AppColors.textFieldColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DropdownButtonFormField(
            validator: (value) => Validations().profValidation(value),
            hint: const Text(
              'Choose your profession',
              style: TextStyle(fontSize: 18, color: AppColors.greyColor),
            ),
            value: signUpController.dropDownValue,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.errorColor),
              ),
            ),
            items: signUpController.itemList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                )
                .toList(),
            onChanged: (newValue) {
              signUpController.onChangeDropDownVaue(newValue!);
            },
          ),
        ),
      ),
    );
  }
}
