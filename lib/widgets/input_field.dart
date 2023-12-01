import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  const InputField(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      padding: const EdgeInsets.all(0.0),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Color(0xFF666666),
          fontWeight: FontWeight.w500,
          fontSize: 18.0,
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          hintStyle: const TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
          ),
          labelStyle: const TextStyle(
            color: Color(0xFFB5B5B5),
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
