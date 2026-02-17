import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.textEditingController,
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.isSecure = false,
    this.onClick,
    this.maxLines = 1,
    required this.validator,
  });

  final int maxLines;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isSecure;
  final VoidCallback? onClick;
  final TextEditingController? textEditingController;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      maxLines: maxLines,
      textInputAction: TextInputAction.done,
      obscureText: isSecure,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon:
            suffixIcon != null
                ? IconButton(onPressed: onClick, icon: Icon(suffixIcon))
                : null,
      ),
    );
  }
}
