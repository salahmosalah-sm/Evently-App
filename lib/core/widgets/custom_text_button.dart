import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.title, required this.onPress,  this.alignment=Alignment.centerRight});
  final String title;
  final VoidCallback onPress;
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(onPressed: onPress , child: Text(title)),
    );
  }
}
