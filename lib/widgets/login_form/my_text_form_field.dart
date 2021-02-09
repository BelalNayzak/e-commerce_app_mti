import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String text;
  final String initialTextValue;
  final int maxLines;
  final Function validate;
  final Function onSave;
  final Function onFieldSubmitted;
  final IconData icon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isPassword;

  MyTextFormField({
    this.text,
    this.initialTextValue = '',
    this.maxLines = 1,
    this.validate,
    this.onSave,
    this.onFieldSubmitted,
    this.icon,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: Colors.grey[700],
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: isPassword,
      initialValue: initialTextValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusColor: Colors.grey[700],
        labelText: text,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          icon,
          color: Colors.grey[700],
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validate,
      onSaved: onSave,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
