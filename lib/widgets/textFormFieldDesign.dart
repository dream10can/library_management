import 'package:flutter/material.dart';

class TextFormFieldDesign extends StatelessWidget {
  const TextFormFieldDesign(
      {this.infoController,
      this.message,
      this.inputType,
      this.hintText,
      this.iconDesign});

  final TextEditingController infoController;

  final String message;

  final TextInputType inputType;

  final String hintText;

  final IconData iconDesign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: infoController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return message;
        }

        return null;
      },
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(15.0),
        ),
        icon: Icon(iconDesign),
        hintText: hintText,
      ),
    );
  }
}
