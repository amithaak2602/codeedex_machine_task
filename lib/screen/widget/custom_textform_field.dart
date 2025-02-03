import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final Widget? icon;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final bool readOnly;

  const CustomTextFormField(
      {super.key,
      this.controller,
      this.hintText,
      this.maxLines,
      this.readOnly = false,
      this.icon,
      this.textInputType,
      this.validator,
      this.focusNode,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      cursorColor: Colors.white,
      readOnly: readOnly,
      maxLines: maxLines ?? 1,
      controller: controller,
      focusNode: focusNode,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20, top: 0, bottom: 20),
        suffixIcon: icon,
        filled: true,
        fillColor: Color(0x40d9d9d9),
        alignLabelWithHint: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
        border: InputBorder.none,
      ),
      validator: validator,
      onTap: onTap,
    );
  }
}
