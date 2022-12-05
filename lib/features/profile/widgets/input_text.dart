import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hintText;
  final bool isPass;
  final TextInputType type;
  final TextEditingController controller;
  final Function(String) onChanged;

  const InputText({
    super.key,
    required this.type,
    required this.hintText,
    this.isPass = false,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE5E5E5),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(14, 173, 105, 1),
          ),
        ),
      ),
      obscureText: isPass ? true : false,
      onChanged: onChanged,
    );
  }
}
