import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.title, required this.onPress, this.alignment = Alignment
          .centerRight, this.underLine = true});
  final String title;
  final VoidCallback onPress;
  final Alignment alignment;
  final bool underLine;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(onPressed: onPress,
          style: TextButton.styleFrom(textStyle: TextStyle(
              decoration: underLine ? TextDecoration.underline : null)),
          child: Text(title)),
    );
  }
}
