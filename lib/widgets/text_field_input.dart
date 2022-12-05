import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType type;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        filled: true,
        fillColor: const Color(0xfff7f8f9),
        hintStyle: const TextStyle(
          fontFamily: 'AvertaStdCY-Regular',
          color: Color(0xff616161),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Nhập $hintText của bạn';
        }

        return null;
      },
    );
  }
}
