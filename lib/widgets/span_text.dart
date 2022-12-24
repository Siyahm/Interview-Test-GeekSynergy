import 'package:api_test/helpers/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextSpanWidget extends StatelessWidget {
  const TextSpanWidget({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.blackColor,
          ),
          children: [
            TextSpan(
              text: buttonText,
              style: const TextStyle(color: AppColors.blueColor, fontSize: 16),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
