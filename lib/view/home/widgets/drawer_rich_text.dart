import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerRichText extends StatelessWidget {
  const DrawerRichText({
    Key? key,
    required this.leading,
    required this.title,
  }) : super(key: key);
  final String leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: leading,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      )),
    );
  }
}
